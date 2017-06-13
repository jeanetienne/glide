//
// Glide
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation
import AVFoundation

public struct Glide {

    enum GlideError: Error {
        case UnsupportedCodec
        case UnknownMediaSize
        case BadConfiguration
        case WorkInProgressError
    }

    enum FileType {
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

    enum Codec {
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

    init(images allImages: [CGImage], frameRate aFrameRate: Int32 = 30, fileType aFileType: FileType = .mov, codec aCodec: Codec = .h264) throws {
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

    func render(at path: URL, progressHandler: ((_ progress: Progress) -> ())? = nil) throws {
        try? FileManager.default.removeItem(at: path)
        let assetWriter = try AVAssetWriter(outputURL: path, fileType: fileType.foundationFileType)

        // Private computed property
        let videoSettings = [
            AVVideoCodecKey: codec.foundationCodec as AnyObject,
            AVVideoWidthKey: mediaSize.width as AnyObject,
            AVVideoHeightKey: mediaSize.height as AnyObject
        ]
        let assetWriterInput = AVAssetWriterInput(mediaType: AVMediaType.video, outputSettings: videoSettings)

        // Can be refactored away
        let sourceBufferAttributes = [
            (kCVPixelBufferPixelFormatTypeKey as String): Int(kCVPixelFormatType_32ARGB),
            (kCVPixelBufferWidthKey as String): Float(mediaSize.width),
            (kCVPixelBufferHeightKey as String): Float(mediaSize.height)] as [String : Any]

        // Can be extracted in a "factory"?
        let pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(
            assetWriterInput: assetWriterInput,
            sourcePixelBufferAttributes: sourceBufferAttributes
        )

        // Can be extracted away in an extension that does the check itself and throws
        if assetWriter.canAdd(assetWriterInput) {
            assetWriter.add(assetWriterInput)
        } else {
            throw GlideError.BadConfiguration
        }

        if assetWriter.startWriting() {
            assetWriter.startSession(atSourceTime: kCMTimeZero)
            assert(pixelBufferAdaptor.pixelBufferPool != nil)

            let mediaInputQueue = DispatchQueue(label: "Glide.mediaInputQueue")

            assetWriterInput.requestMediaDataWhenReady(on: mediaInputQueue) {
                let frameDuration = CMTimeMake(1, self.frameRate)
                let currentProgress = Progress(totalUnitCount: Int64(self.images.count))

                var frameCount: Int64 = 0
                var remainingImages = self.images

                while assetWriterInput.isReadyForMoreMediaData && !remainingImages.isEmpty {
                    let nextImage = remainingImages.remove(at: 0)
                    let lastFrameTime = CMTimeMake(frameCount, self.frameRate)
                    let presentationTime = frameCount == 0 ? lastFrameTime : CMTimeAdd(lastFrameTime, frameDuration)

                    if !self.appendPixelBufferWith(nextImage, pixelBufferAdaptor: pixelBufferAdaptor, presentationTime: presentationTime) {
//                        throw GlideError.WorkInProgressError
//                        error = NSError(
//                            domain: kErrorDomain,
//                            code: kFailedToAppendPixelBufferError,
//                            userInfo: ["description": "AVAssetWriterInputPixelBufferAdapter failed to append pixel buffer"]
//                        )

                        print("Could not append to the pixel buffer")
                        break
                    }

                    frameCount += 1

                    currentProgress.completedUnitCount = frameCount
//                    progressHandler(currentProgress)
                }

                assetWriterInput.markAsFinished()
                assetWriter.finishWriting {
//                    if let error = error {
//                        failure(error)
//                    } else {
//                        success(videoOutputURL)
//                    }

//                    assetWriter = nil
                }
            }
        } else {
//            throw GlideError.WorkInProgressError
//            error = NSError(
//                domain: kErrorDomain,
//                code: kFailedToStartAssetWriterError,
//                userInfo: ["description": "AVAssetWriter failed to start writing"]
//            )
            print("The asset writer could not start writing")
        }

    }

    private func appendPixelBufferWith(_ image: CGImage, pixelBufferAdaptor: AVAssetWriterInputPixelBufferAdaptor, presentationTime: CMTime) -> Bool {
        var appendSucceeded = false

        autoreleasepool {
            if let pixelBufferPool = pixelBufferAdaptor.pixelBufferPool {
                let pixelBufferPointer = UnsafeMutablePointer<CVPixelBuffer?>.allocate(capacity: 1)
                let status: CVReturn = CVPixelBufferPoolCreatePixelBuffer(
                    kCFAllocatorDefault,
                    pixelBufferPool,
                    pixelBufferPointer
                )

                if let pixelBuffer = pixelBufferPointer.pointee, status == 0 {
                    fillPixelBufferFromImage(image, pixelBuffer: pixelBuffer)

                    appendSucceeded = pixelBufferAdaptor.append(
                        pixelBuffer,
                        withPresentationTime: presentationTime
                    )

                    pixelBufferPointer.deinitialize()
                } else {
                    NSLog("error: Failed to allocate pixel buffer from pool")
                }

                pixelBufferPointer.deallocate(capacity: 1)
            }
        }

        return appendSucceeded
    }

    private func fillPixelBufferFromImage(_ image: CGImage, pixelBuffer: CVPixelBuffer) {
        CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))

        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(
            data: pixelData,
            width: Int(image.width),
            height: Int(image.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
            space: rgbColorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        )

        context?.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))

        CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
    }

}
