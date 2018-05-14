//
// Glide
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation
import AVFoundation

public enum Result<T> {
    case success(T)
    case error(Error)
}

public struct Progress {

    let totalUnitCount: Int64
    var completedUnitCount: Int64 = 0
    var localizedDescription: String
    var isCompleted: Bool {
        return completedUnitCount == totalUnitCount
    }

    init(totalUnitCount: Int64) {
        self.totalUnitCount = totalUnitCount
        self.localizedDescription = "Adding \(totalUnitCount) images..."
    }

}

public struct Frame {

    let imagePath: URL

    let repeatCounter: Int64

    /// Represents which part of the image to use when painting the frame
    let cropRect: CGRect

    /// Represents where the frame will be painted within the output of size `Glide.outputSize`
    let outputWindow: CGRect

    let backgroundColor: CGColor

    var image: CGImage? {
        if let imageSource = CGImageSourceCreateWithURL(imagePath as CFURL, nil) {
            var image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            if cropRect != CGRect.zero {
                image = image?.cropping(to: cropRect)
            }

            return image
        }

        return nil
    }

    public init(imagePath path: URL, outputWindow anOutputWindow: CGRect, repeat aRepeatCounter: Int64 = 1, cropRect aCropRect: CGRect = CGRect.zero, backgroundColor aBackgroundColor: CGColor = CGColor.black) {
        imagePath = path
        repeatCounter = aRepeatCounter
        outputWindow = anOutputWindow
        cropRect = aCropRect
        backgroundColor = aBackgroundColor
    }

}

public enum FileType {
    case mov
    case mp4
    case m4v
    case mobile3GPP
    case mobile3GPP2

    fileprivate var foundationFileType: AVFileType {
        switch self {
        case .mov:
            return AVFileType.mov
        case .mp4:
            return AVFileType.mp4
        case .m4v:
            return AVFileType.m4v
        case .mobile3GPP:
            return AVFileType.mobile3GPP
        case .mobile3GPP2:
            return AVFileType.mobile3GPP2
        }
    }
}

public enum Codec {
    case h264
    case hevc
    case jpeg
    case proRes4444
    case proRes422

    fileprivate var foundationCodec: String {
        switch self {
        case .h264:
            return AVVideoCodecH264
        case .hevc:
            if #available(OSX 10.13, *) {
                return AVVideoCodecHEVC
            } else {
                return AVVideoCodecH264
            }
        case .jpeg:
            return AVVideoCodecJPEG
        case .proRes4444:
            return AVVideoCodecAppleProRes4444
        case .proRes422:
            return AVVideoCodecAppleProRes422
        }
    }
}

public class Glide {

    private let frames: [Frame]

    private let frameRate: Int32

    private let fileType: FileType

    private let codec: Codec

    private let outputSize: CGSize

    private var totalFrameCount: Int64 {
        return frames.reduce(0) { $0 + $1.repeatCounter }
    }

    private let kErrorDomain = "net.jeanetienne.Glide.Error"

    private let kErrorUserInfoMessageKey = "GlideErrorMessage"

    private let kErrorUserInfoAssociatedErrorKey = "GlideErrorAssociatedError"

    public init(frames allFrames: [Frame], frameRate aFrameRate: Int32 = 30, outputSize anOutputSize: CGSize, fileType aFileType: FileType = .mov, codec aCodec: Codec = .h264) {
        frames = allFrames
        frameRate = aFrameRate
        outputSize = anOutputSize
        fileType = aFileType
        codec = aCodec
    }

    public func render(at path: URL,
                completion: @escaping (Result<URL>) -> (),
                progressHandler: ((_ progress: Progress) -> ())? = nil) {
        try? FileManager.default.removeItem(at: path)
        guard let assetWriter = try? AVAssetWriter(outputURL: path, fileType: fileType.foundationFileType) else {
            complete(completion,
                     withError: error(withCode: 1,
                                      message: "Unable to initialize AVAssetWriter. Check validity of render path URL and file type."))
            return
        }
        let assetWriterInput = AVAssetWriterInput(size: outputSize, codec: codec)
        let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(size: outputSize,
                                                                      assetWriterInput: assetWriterInput)

        if !assetWriter.didAdd(assetWriterInput) {
            complete(completion,
                     withError: error(withCode: 2,
                                      message: "Unable to add an AVAssetWriterInput. Check validity of output size and codec."))
            return
        }

        if assetWriter.startWriting() {
            assetWriter.startSession(atSourceTime: kCMTimeZero)
            guard let _ = pixelBufferAdaptor.pixelBufferPool else {
                complete(completion,
                         withError: error(withCode: 3,
                                          message: "Unable to create a CVPixelBufferPool."))
                return
            }

            var progress = Progress(totalUnitCount: totalFrameCount)
            var frameCount: Int64 = 0
            var iterator = frames.makeIterator()

            assetWriterInput.requestMediaDataWhenReady(on: DispatchQueue(label: "glide.queue.mediaInput")) {
                while assetWriterInput.isReadyForMoreMediaData {
                    if let nextFrame = iterator.next() {

                        for _ in 0..<nextFrame.repeatCounter {
                            let frameTime = CMTimeMake(frameCount, self.frameRate)
                            if !pixelBufferAdaptor.append(frame: nextFrame, forOutputSize: self.outputSize, at: frameTime) {
                                assetWriterInput.markAsFinished()
                                assetWriter.cancelWriting()

                                let errorMessage = "Unable to append frame to pixel buffer"
                                self.complete(completion,
                                              withError: self.error(withCode: 4,
                                                                    message: errorMessage))
                                break
                            }

                            frameCount += 1
                            progress.completedUnitCount = frameCount
                            DispatchQueue.main.async {
                                progressHandler?(progress)
                            }
                        }
                    } else {
                        assetWriterInput.markAsFinished()
                        assetWriter.finishWriting {
                            DispatchQueue.main.async {
                                completion(Result.success(path))
                            }
                        }
                    }
                }
            }
        } else {
            complete(completion,
                     withError: error(withCode: 5,
                                      message: "AVAssetWriter was unable to start writing. See associated error.",
                                      associatedError: assetWriter.error))
            return
        }
    }

    private func error(withCode code: Int, message: String, associatedError: Error? = nil) -> Result<URL> {
        var userInfo: [String: Any] = [
            kErrorUserInfoMessageKey: message
        ]

        if let associatedError = associatedError {
            userInfo[kErrorUserInfoAssociatedErrorKey] = associatedError
        }

        return Result.error(NSError(domain: kErrorDomain,
                                    code: code,
                                    userInfo: userInfo))

    }

    private func complete(_ completion: @escaping (Result<URL>) -> (), withError error: Result<URL>) {
        DispatchQueue.main.async {
            completion(error)
        }
    }

}

fileprivate extension AVAssetWriter {

    fileprivate func didAdd(_ assetWriterInput: AVAssetWriterInput) -> Bool {
        if canAdd(assetWriterInput) {
            add(assetWriterInput)
            return true
        } else {
            return false
        }
    }

}

fileprivate extension AVAssetWriterInput {

    fileprivate convenience init(size: CGSize, codec: Codec) {
        let videoSettings = [
            AVVideoCodecKey: codec.foundationCodec as AnyObject,
            AVVideoWidthKey: size.width as AnyObject,
            AVVideoHeightKey: size.height as AnyObject
        ]
        self.init(mediaType: AVMediaType.video, outputSettings: videoSettings)
    }

}

fileprivate extension AVAssetWriterInputPixelBufferAdaptor {

    fileprivate convenience init(size: CGSize, assetWriterInput: AVAssetWriterInput) {
        let sourceBufferAttributes = [
            (kCVPixelBufferPixelFormatTypeKey as String): Int(kCVPixelFormatType_32ARGB),
            (kCVPixelBufferWidthKey as String): Float(size.width),
            (kCVPixelBufferHeightKey as String): Float(size.height)
            ] as [String : Any]

        self.init(assetWriterInput: assetWriterInput,
                  sourcePixelBufferAttributes: sourceBufferAttributes)
    }

    fileprivate func append(frame: Frame, forOutputSize outputSize: CGSize, at presentationTime: CMTime) -> Bool {
        guard let pixelBufferPool = pixelBufferPool else {
            return false
        }

        let pixelBufferCapacity = 1
        let pixelBufferPointer = UnsafeMutablePointer<CVPixelBuffer?>.allocate(capacity: pixelBufferCapacity)
        let pixelBufferCreated = CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault,
                                                                    pixelBufferPool,
                                                                    pixelBufferPointer)

        guard let
            pixelBuffer = pixelBufferPointer.pointee,
            pixelBufferCreated == kCVReturnSuccess
            else {
                return false
        }

        pixelBuffer.fill(withFrame: frame, forOutputSize: outputSize)
        let appendSucceeded = append(pixelBuffer,
                                     withPresentationTime: presentationTime)

        pixelBufferPointer.deinitialize(count: pixelBufferCapacity)
        pixelBufferPointer.deallocate()

        return appendSucceeded
    }

}

fileprivate extension CVPixelBuffer {

    fileprivate func fill(withFrame frame: Frame, forOutputSize outputSize: CGSize) {
        guard let image = frame.image else {
            return
        }
        CVPixelBufferLockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))

        let pixelData = CVPixelBufferGetBaseAddress(self)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData,
                                width: Int(outputSize.width),
                                height: Int(outputSize.height),
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(self),
                                space: rgbColorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)

        context?.setFillColor(frame.backgroundColor)
        context?.fill(CGRect(origin: CGPoint.zero, size: outputSize))
        context?.draw(image, in: frame.outputWindow)

        CVPixelBufferUnlockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
    }

}
