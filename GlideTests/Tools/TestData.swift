//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import AppKit

struct TestData {

    static var someSampleImages: [CGImage] = { () -> [CGImage] in
        let images = [
            NSImage(jpegNamed: "2014-09-23@16-02-39"),
            NSImage(jpegNamed: "2014-09-23@16-02-59"),
            NSImage(jpegNamed: "2014-09-23@16-03-19"),
            NSImage(jpegNamed: "2014-09-23@16-03-39"),
            NSImage(jpegNamed: "2014-09-23@16-03-59")
            ]
        return images.flatMap { $0 }
            .map { image -> CGImage? in
                return image.cgImage
            }
            .flatMap { $0 }
    }()

    static var allSampleImages: [CGImage] = { () -> [CGImage] in
        let images = [
            NSImage(jpegNamed: "2014-09-23@16-02-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-02-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-03-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-03-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-03-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-04-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-04-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-04-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-05-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-05-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-05-58.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-06-18.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-06-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-06-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-07-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-07-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-07-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-08-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-08-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-08-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-09-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-09-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-09-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-10-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-10-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-10-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-11-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-11-38.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-11-58.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-12-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-12-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-12-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-13-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-13-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-13-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-14-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-14-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-14-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-15-18.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-15-38.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-15-58.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-16-18.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-16-38.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-16-58.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-17-19.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-17-39.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-17-59.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-18-18.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-18-38.jpg"),
            NSImage(jpegNamed: "2014-09-23@16-18-59.jpg")
        ]

        return images.flatMap { $0 }
            .map { image -> CGImage? in
                return image.cgImage
            }
            .flatMap { $0 }
    }()

//    static func createCacheFolder() {
//        self.removeCacheFolder()
//        try? FileManager.default.createDirectory(at: URL.cacheFolder,
//                                                 withIntermediateDirectories: true,
//                                                 attributes: nil)
//    }
//
//    static func removeCacheFolder() {
//        try? FileManager.default.removeItem(at: URL.cacheFolder)
//    }
//
//    static func copyCompressedSampleAppIconSetToCacheFolder() {
//        let fileManager = FileManager.default
//        let compressedSampleAppIconSetPath = Bundle.tests.url(forResource: "SampleAppIcon.appiconset", withExtension: "zip")!
//        do {
//            try fileManager.copyItem(at: compressedSampleAppIconSetPath, to: URL.cacheFolder.appendingPathComponent("SampleAppIcon.appiconset.zip"))
//        } catch {
//            print("Could not move 'SampleAppIcon.appiconset' to test folder")
//        }
//    }
//
//    static func decompressSampleAppIconSet() {
//        let compressedSampleAppIconSetPath = URL.cacheFolder.appendingPathComponent("SampleAppIcon.appiconset.zip")
//        let unzipProcess = Process()
//        unzipProcess.launchPath = "/usr/bin/unzip"
//        unzipProcess.arguments = [
//            compressedSampleAppIconSetPath.path,
//            "-d",
//            URL.cacheFolder.path
//        ]
//        unzipProcess.launch()
//        unzipProcess.waitUntilExit()
//    }
//
//    static func image(named name: String) -> NSImage? {
//        if let imageURL = Bundle.tests.url(forResource: name, withExtension: "png") {
//            return NSImage(contentsOf: imageURL)
//        } else {
//            return nil
//        }
//    }

}

