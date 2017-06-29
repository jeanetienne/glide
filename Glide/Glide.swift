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

public struct Glide {

    public enum GlideError: Error {
        case UnsupportedCodec
        case UnknownMediaSize
        case BadConfiguration
        case WorkInProgressError
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
                return AVVideoCodecH264
            case .jpeg:
                return AVVideoCodecJPEG
            case .proRes4444:
                return AVVideoCodecH264
            case .proRes422:
                return AVVideoCodecH264
            }
        }
    }

    private let images: [CGImage]

    private let frameRate: Int32

    private let fileType: FileType

    private let codec: Codec

    private let mediaSize: CGSize

    public init(images allImages: [CGImage], frameRate aFrameRate: Int32 = 30, fileType aFileType: FileType = .mov, codec aCodec: Codec = .h264) throws {
        images = allImages
        frameRate = aFrameRate
        fileType = aFileType
        codec = aCodec

        if let firstImage = allImages.first {
            mediaSize = CGSize(width: firstImage.width, height: firstImage.height)
        } else {
            throw GlideError.UnknownMediaSize
        }
    }

    public func render(at path: URL,
                completion: @escaping (Result<URL>) -> (),
                progressHandler: ((_ progress: Progress) -> ())? = nil) {
        try? FileManager.default.removeItem(at: path)
        guard let assetWriter = try? AVAssetWriter(outputURL: path, fileType: fileType.foundationFileType) else {
            completion(Result.error(NSError()))
            return
        }
        let assetWriterInput = AVAssetWriterInput(size: mediaSize, codec: codec)
        let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(size: mediaSize,
                                                                      assetWriterInput: assetWriterInput)

        if !assetWriter.didAdd(assetWriterInput) {
            completion(Result.error(NSError()))
            return
        }

        if assetWriter.startWriting() {
            assetWriter.startSession(atSourceTime: kCMTimeZero)
            guard let _ = pixelBufferAdaptor.pixelBufferPool else {
                completion(Result.error(NSError()))
                return
            }

            let frameDuration = CMTimeMake(1, self.frameRate)
            let progress = Progress(totalUnitCount: Int64(self.images.count))
            var frameCount: Int64 = 0
            var iterator = self.images.makeIterator()

            assetWriterInput.requestMediaDataWhenReady(on: DispatchQueue(label: "glide.queue.mediaInput")) {
                while assetWriterInput.isReadyForMoreMediaData {
                    if let nextImage = iterator.next() {
                        let frameTime = CMTimeMake(frameCount, self.frameRate)
                        let presentationTime = frameCount == 0 ? frameTime : CMTimeAdd(frameTime, frameDuration)

                        if !pixelBufferAdaptor.append(image: nextImage, at: presentationTime) {
                            assetWriterInput.markAsFinished()
                            assetWriter.cancelWriting()
                            completion(Result.error(NSError()))
                            break
                        }

                        frameCount += 1
                        progress.completedUnitCount = frameCount
                        progressHandler?(progress)
                    } else {
                        assetWriterInput.markAsFinished()
                        assetWriter.finishWriting {
                            completion(Result.success(path))
                        }
                    }
                }
            }
        } else {
            completion(Result.error(NSError()))
            return
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

    fileprivate convenience init(size: CGSize, codec: Glide.Codec) {
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

    fileprivate func append(image: CGImage, at presentationTime: CMTime) -> Bool {
        guard let pixelBufferPool = pixelBufferPool else {
            return false
        }

        let pixelBufferCapacity = 1
        let pixelBufferPointer = UnsafeMutablePointer<CVPixelBuffer?>.allocate(capacity: pixelBufferCapacity)
        let pixelBufferCreated = CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault,
                                                                    pixelBufferPool,
                                                                    pixelBufferPointer)

        guard let pixelBuffer = pixelBufferPointer.pointee,
            pixelBufferCreated == kCVReturnSuccess else {
                NSLog("error: Failed to allocate pixel buffer from pool")
                return false
        }

        pixelBuffer.fill(withImage: image)
        let appendSucceeded = append(pixelBuffer,
                                     withPresentationTime: presentationTime)

        pixelBufferPointer.deinitialize()
        pixelBufferPointer.deallocate(capacity: pixelBufferCapacity)

        return appendSucceeded
    }

}

fileprivate extension CVPixelBuffer {

    fileprivate func fill(withImage image: CGImage) {
        CVPixelBufferLockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))

        let pixelData = CVPixelBufferGetBaseAddress(self)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData,
                                width: Int(image.width),
                                height: Int(image.height),
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(self),
                                space: rgbColorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)

        let rect = CGRect(x: 0, y: 0, width: image.width, height: image.height)
        context?.draw(image, in: rect)

        CVPixelBufferUnlockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
    }

}
