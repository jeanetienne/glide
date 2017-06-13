//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import AppKit

struct TestData {

    static var sunsetTimelapseImages: [CGImage] = { () -> [CGImage] in
        let images = [
            NSImage(jpegNamed: "2014-09-23@18-49-25"),
            NSImage(jpegNamed: "2014-09-23@18-49-45"),
            NSImage(jpegNamed: "2014-09-23@18-50-05"),
            NSImage(jpegNamed: "2014-09-23@18-50-25"),
            NSImage(jpegNamed: "2014-09-23@18-50-45"),
            NSImage(jpegNamed: "2014-09-23@18-51-05"),
            NSImage(jpegNamed: "2014-09-23@18-51-25"),
            NSImage(jpegNamed: "2014-09-23@18-51-45"),
            NSImage(jpegNamed: "2014-09-23@18-52-05"),
            NSImage(jpegNamed: "2014-09-23@18-52-25"),
            NSImage(jpegNamed: "2014-09-23@18-52-45"),
            NSImage(jpegNamed: "2014-09-23@18-53-05"),
            NSImage(jpegNamed: "2014-09-23@18-53-25"),
            NSImage(jpegNamed: "2014-09-23@18-53-45"),
            NSImage(jpegNamed: "2014-09-23@18-54-05"),
            NSImage(jpegNamed: "2014-09-23@18-54-25"),
            NSImage(jpegNamed: "2014-09-23@18-54-45"),
            NSImage(jpegNamed: "2014-09-23@18-55-05"),
            NSImage(jpegNamed: "2014-09-23@18-55-25"),
            NSImage(jpegNamed: "2014-09-23@18-55-45"),
            NSImage(jpegNamed: "2014-09-23@18-56-05"),
            NSImage(jpegNamed: "2014-09-23@18-56-25"),
            NSImage(jpegNamed: "2014-09-23@18-56-45"),
            NSImage(jpegNamed: "2014-09-23@18-57-05"),
            NSImage(jpegNamed: "2014-09-23@18-57-25"),
            NSImage(jpegNamed: "2014-09-23@18-57-45"),
            NSImage(jpegNamed: "2014-09-23@18-58-05"),
            NSImage(jpegNamed: "2014-09-23@18-58-25"),
            NSImage(jpegNamed: "2014-09-23@18-58-45"),
            NSImage(jpegNamed: "2014-09-23@18-59-05"),
            NSImage(jpegNamed: "2014-09-23@18-59-25"),
            NSImage(jpegNamed: "2014-09-23@18-59-45"),
            NSImage(jpegNamed: "2014-09-23@19-00-05"),
            NSImage(jpegNamed: "2014-09-23@19-00-25"),
            NSImage(jpegNamed: "2014-09-23@19-00-45"),
            NSImage(jpegNamed: "2014-09-23@19-01-05"),
            NSImage(jpegNamed: "2014-09-23@19-01-25"),
            NSImage(jpegNamed: "2014-09-23@19-01-45"),
            NSImage(jpegNamed: "2014-09-23@19-02-05"),
            NSImage(jpegNamed: "2014-09-23@19-02-25"),
            NSImage(jpegNamed: "2014-09-23@19-02-45"),
            NSImage(jpegNamed: "2014-09-23@19-03-05"),
            NSImage(jpegNamed: "2014-09-23@19-03-25"),
            NSImage(jpegNamed: "2014-09-23@19-03-45"),
            NSImage(jpegNamed: "2014-09-23@19-04-05"),
            NSImage(jpegNamed: "2014-09-23@19-04-25"),
            NSImage(jpegNamed: "2014-09-23@19-04-45"),
            NSImage(jpegNamed: "2014-09-23@19-05-05"),
            NSImage(jpegNamed: "2014-09-23@19-05-25"),
            NSImage(jpegNamed: "2014-09-23@19-05-45"),
            NSImage(jpegNamed: "2014-09-23@19-06-05"),
            NSImage(jpegNamed: "2014-09-23@19-06-25"),
            NSImage(jpegNamed: "2014-09-23@19-06-45"),
            NSImage(jpegNamed: "2014-09-23@19-07-05"),
            NSImage(jpegNamed: "2014-09-23@19-07-25"),
            NSImage(jpegNamed: "2014-09-23@19-07-45"),
            NSImage(jpegNamed: "2014-09-23@19-08-05"),
            NSImage(jpegNamed: "2014-09-23@19-08-25"),
            NSImage(jpegNamed: "2014-09-23@19-08-45"),
            NSImage(jpegNamed: "2014-09-23@19-09-05"),
            NSImage(jpegNamed: "2014-09-23@19-09-25"),
            NSImage(jpegNamed: "2014-09-23@19-09-45"),
            NSImage(jpegNamed: "2014-09-23@19-10-05"),
            NSImage(jpegNamed: "2014-09-23@19-10-25"),
            NSImage(jpegNamed: "2014-09-23@19-10-45"),
            NSImage(jpegNamed: "2014-09-23@19-11-05"),
            NSImage(jpegNamed: "2014-09-23@19-11-25"),
            NSImage(jpegNamed: "2014-09-23@19-11-45"),
            NSImage(jpegNamed: "2014-09-23@19-12-05"),
            NSImage(jpegNamed: "2014-09-23@19-12-25"),
            NSImage(jpegNamed: "2014-09-23@19-12-45"),
            NSImage(jpegNamed: "2014-09-23@19-13-05"),
            NSImage(jpegNamed: "2014-09-23@19-13-25"),
            NSImage(jpegNamed: "2014-09-23@19-13-45"),
            NSImage(jpegNamed: "2014-09-23@19-14-05"),
            NSImage(jpegNamed: "2014-09-23@19-14-25"),
            NSImage(jpegNamed: "2014-09-23@19-14-45"),
            NSImage(jpegNamed: "2014-09-23@19-15-05"),
            NSImage(jpegNamed: "2014-09-23@19-15-25"),
            NSImage(jpegNamed: "2014-09-23@19-15-45"),
            NSImage(jpegNamed: "2014-09-23@19-16-05"),
            NSImage(jpegNamed: "2014-09-23@19-16-25"),
            NSImage(jpegNamed: "2014-09-23@19-16-45"),
            NSImage(jpegNamed: "2014-09-23@19-17-05"),
            NSImage(jpegNamed: "2014-09-23@19-17-25"),
            NSImage(jpegNamed: "2014-09-23@19-17-45"),
            NSImage(jpegNamed: "2014-09-23@19-18-05"),
            NSImage(jpegNamed: "2014-09-23@19-18-25"),
            NSImage(jpegNamed: "2014-09-23@19-18-45"),
            NSImage(jpegNamed: "2014-09-23@19-19-05"),
            NSImage(jpegNamed: "2014-09-23@19-19-25"),
            NSImage(jpegNamed: "2014-09-23@19-19-45"),
            NSImage(jpegNamed: "2014-09-23@19-20-05"),
            NSImage(jpegNamed: "2014-09-23@19-20-25"),
            NSImage(jpegNamed: "2014-09-23@19-20-45"),
            NSImage(jpegNamed: "2014-09-23@19-21-05"),
            NSImage(jpegNamed: "2014-09-23@19-21-25"),
            NSImage(jpegNamed: "2014-09-23@19-21-45"),
            NSImage(jpegNamed: "2014-09-23@19-22-05"),
            NSImage(jpegNamed: "2014-09-23@19-22-25"),
            NSImage(jpegNamed: "2014-09-23@19-22-45"),
            NSImage(jpegNamed: "2014-09-23@19-23-05"),
            NSImage(jpegNamed: "2014-09-23@19-23-25"),
            NSImage(jpegNamed: "2014-09-23@19-23-45"),
            NSImage(jpegNamed: "2014-09-23@19-24-05"),
            NSImage(jpegNamed: "2014-09-23@19-24-25"),
            NSImage(jpegNamed: "2014-09-23@19-24-45"),
            NSImage(jpegNamed: "2014-09-23@19-25-05"),
            NSImage(jpegNamed: "2014-09-23@19-25-25"),
            NSImage(jpegNamed: "2014-09-23@19-25-45"),
            NSImage(jpegNamed: "2014-09-23@19-26-05"),
            NSImage(jpegNamed: "2014-09-23@19-26-25"),
            NSImage(jpegNamed: "2014-09-23@19-26-45"),
            NSImage(jpegNamed: "2014-09-23@19-27-05"),
            NSImage(jpegNamed: "2014-09-23@19-27-25"),
            NSImage(jpegNamed: "2014-09-23@19-27-45"),
            NSImage(jpegNamed: "2014-09-23@19-28-05"),
            NSImage(jpegNamed: "2014-09-23@19-28-25"),
            NSImage(jpegNamed: "2014-09-23@19-28-45"),
            NSImage(jpegNamed: "2014-09-23@19-29-05"),
            NSImage(jpegNamed: "2014-09-23@19-29-25"),
            NSImage(jpegNamed: "2014-09-23@19-29-45"),
            NSImage(jpegNamed: "2014-09-23@19-30-05"),
            NSImage(jpegNamed: "2014-09-23@19-30-25"),
            NSImage(jpegNamed: "2014-09-23@19-30-45"),
            NSImage(jpegNamed: "2014-09-23@19-31-05"),
            NSImage(jpegNamed: "2014-09-23@19-31-25"),
            NSImage(jpegNamed: "2014-09-23@19-31-45"),
            NSImage(jpegNamed: "2014-09-23@19-32-05"),
            NSImage(jpegNamed: "2014-09-23@19-32-25"),
            NSImage(jpegNamed: "2014-09-23@19-32-45"),
            NSImage(jpegNamed: "2014-09-23@19-33-05"),
            NSImage(jpegNamed: "2014-09-23@19-33-25"),
            NSImage(jpegNamed: "2014-09-23@19-33-45"),
            NSImage(jpegNamed: "2014-09-23@19-34-05"),
            NSImage(jpegNamed: "2014-09-23@19-34-25"),
            NSImage(jpegNamed: "2014-09-23@19-34-45"),
            NSImage(jpegNamed: "2014-09-23@19-35-05"),
            NSImage(jpegNamed: "2014-09-23@19-35-25"),
            NSImage(jpegNamed: "2014-09-23@19-35-45"),
            NSImage(jpegNamed: "2014-09-23@19-36-05"),
            NSImage(jpegNamed: "2014-09-23@19-36-25"),
            NSImage(jpegNamed: "2014-09-23@19-36-45"),
            NSImage(jpegNamed: "2014-09-23@19-37-05"),
            NSImage(jpegNamed: "2014-09-23@19-37-25"),
            NSImage(jpegNamed: "2014-09-23@19-37-45"),
            NSImage(jpegNamed: "2014-09-23@19-38-05"),
            NSImage(jpegNamed: "2014-09-23@19-38-25"),
            NSImage(jpegNamed: "2014-09-23@19-38-45"),
            NSImage(jpegNamed: "2014-09-23@19-39-05"),
            NSImage(jpegNamed: "2014-09-23@19-39-25"),
            NSImage(jpegNamed: "2014-09-23@19-39-45"),
            NSImage(jpegNamed: "2014-09-23@19-40-05"),
            NSImage(jpegNamed: "2014-09-23@19-40-25"),
            NSImage(jpegNamed: "2014-09-23@19-40-45"),
            NSImage(jpegNamed: "2014-09-23@19-41-05"),
            NSImage(jpegNamed: "2014-09-23@19-41-25"),
            NSImage(jpegNamed: "2014-09-23@19-41-45"),
            NSImage(jpegNamed: "2014-09-23@19-42-05"),
            NSImage(jpegNamed: "2014-09-23@19-42-25"),
            NSImage(jpegNamed: "2014-09-23@19-42-45"),
            NSImage(jpegNamed: "2014-09-23@19-43-05"),
            NSImage(jpegNamed: "2014-09-23@19-43-25"),
            NSImage(jpegNamed: "2014-09-23@19-43-45"),
            NSImage(jpegNamed: "2014-09-23@19-44-05"),
            NSImage(jpegNamed: "2014-09-23@19-44-25"),
            NSImage(jpegNamed: "2014-09-23@19-44-45"),
            NSImage(jpegNamed: "2014-09-23@19-45-05"),
            NSImage(jpegNamed: "2014-09-23@19-45-25"),
            NSImage(jpegNamed: "2014-09-23@19-45-45"),
            NSImage(jpegNamed: "2014-09-23@19-46-05"),
            NSImage(jpegNamed: "2014-09-23@19-46-25"),
            NSImage(jpegNamed: "2014-09-23@19-46-45"),
            NSImage(jpegNamed: "2014-09-23@19-47-05"),
            NSImage(jpegNamed: "2014-09-23@19-47-25"),
            NSImage(jpegNamed: "2014-09-23@19-47-45"),
            NSImage(jpegNamed: "2014-09-23@19-48-05"),
            NSImage(jpegNamed: "2014-09-23@19-48-25"),
            NSImage(jpegNamed: "2014-09-23@19-48-45"),
            NSImage(jpegNamed: "2014-09-23@19-49-05"),
            NSImage(jpegNamed: "2014-09-23@19-49-25"),
            NSImage(jpegNamed: "2014-09-23@19-49-45"),
            NSImage(jpegNamed: "2014-09-23@19-50-05"),
            NSImage(jpegNamed: "2014-09-23@19-50-25"),
            NSImage(jpegNamed: "2014-09-23@19-50-45"),
            NSImage(jpegNamed: "2014-09-23@19-51-05"),
            NSImage(jpegNamed: "2014-09-23@19-51-25"),
            NSImage(jpegNamed: "2014-09-23@19-51-45"),
            NSImage(jpegNamed: "2014-09-23@19-52-05"),
            NSImage(jpegNamed: "2014-09-23@19-52-25"),
            NSImage(jpegNamed: "2014-09-23@19-52-45"),
            NSImage(jpegNamed: "2014-09-23@19-53-05"),
            NSImage(jpegNamed: "2014-09-23@19-53-28"),
            NSImage(jpegNamed: "2014-09-23@19-53-52"),
            NSImage(jpegNamed: "2014-09-23@19-54-15"),
            NSImage(jpegNamed: "2014-09-23@19-54-37"),
            NSImage(jpegNamed: "2014-09-23@19-55-01"),
            NSImage(jpegNamed: "2014-09-23@19-55-22"),
            NSImage(jpegNamed: "2014-09-23@19-55-46"),
            NSImage(jpegNamed: "2014-09-23@19-56-09"),
            NSImage(jpegNamed: "2014-09-23@19-56-33"),
            NSImage(jpegNamed: "2014-09-23@19-56-56"),
            NSImage(jpegNamed: "2014-09-23@19-57-18"),
            NSImage(jpegNamed: "2014-09-23@19-57-41"),
            NSImage(jpegNamed: "2014-09-23@19-58-05"),
            NSImage(jpegNamed: "2014-09-23@19-58-28"),
            NSImage(jpegNamed: "2014-09-23@19-58-52"),
            NSImage(jpegNamed: "2014-09-23@19-59-15"),
            NSImage(jpegNamed: "2014-09-23@19-59-39"),
            NSImage(jpegNamed: "2014-09-23@20-00-02"),
            NSImage(jpegNamed: "2014-09-23@20-00-26"),
            NSImage(jpegNamed: "2014-09-23@20-00-49"),
            NSImage(jpegNamed: "2014-09-23@20-01-13"),
            NSImage(jpegNamed: "2014-09-23@20-01-36"),
            NSImage(jpegNamed: "2014-09-23@20-02-00"),
            NSImage(jpegNamed: "2014-09-23@20-02-23"),
            NSImage(jpegNamed: "2014-09-23@20-02-47")            ]
        return images.flatMap { $0 }
            .map { image -> CGImage? in
                return image.cgImage
            }
            .flatMap { $0 }
    }()

    static var dayTimelapseImages: [CGImage] = { () -> [CGImage] in
        let images = [
            NSImage(jpegNamed: "2014-09-23@16-02-39"),
            NSImage(jpegNamed: "2014-09-23@16-02-59"),
            NSImage(jpegNamed: "2014-09-23@16-03-19"),
            NSImage(jpegNamed: "2014-09-23@16-03-39"),
            NSImage(jpegNamed: "2014-09-23@16-03-59"),
            NSImage(jpegNamed: "2014-09-23@16-04-19"),
            NSImage(jpegNamed: "2014-09-23@16-04-39"),
            NSImage(jpegNamed: "2014-09-23@16-04-59"),
            NSImage(jpegNamed: "2014-09-23@16-05-19"),
            NSImage(jpegNamed: "2014-09-23@16-05-39"),
            NSImage(jpegNamed: "2014-09-23@16-05-58"),
            NSImage(jpegNamed: "2014-09-23@16-06-18"),
            NSImage(jpegNamed: "2014-09-23@16-06-39"),
            NSImage(jpegNamed: "2014-09-23@16-06-59"),
            NSImage(jpegNamed: "2014-09-23@16-07-19"),
            NSImage(jpegNamed: "2014-09-23@16-07-39"),
            NSImage(jpegNamed: "2014-09-23@16-07-59"),
            NSImage(jpegNamed: "2014-09-23@16-08-19"),
            NSImage(jpegNamed: "2014-09-23@16-08-39"),
            NSImage(jpegNamed: "2014-09-23@16-08-59"),
            NSImage(jpegNamed: "2014-09-23@16-09-19"),
            NSImage(jpegNamed: "2014-09-23@16-09-39"),
            NSImage(jpegNamed: "2014-09-23@16-09-59"),
            NSImage(jpegNamed: "2014-09-23@16-10-19"),
            NSImage(jpegNamed: "2014-09-23@16-10-39"),
            NSImage(jpegNamed: "2014-09-23@16-10-59"),
            NSImage(jpegNamed: "2014-09-23@16-11-19"),
            NSImage(jpegNamed: "2014-09-23@16-11-38"),
            NSImage(jpegNamed: "2014-09-23@16-11-58"),
            NSImage(jpegNamed: "2014-09-23@16-12-19"),
            NSImage(jpegNamed: "2014-09-23@16-12-39"),
            NSImage(jpegNamed: "2014-09-23@16-12-59"),
            NSImage(jpegNamed: "2014-09-23@16-13-19"),
            NSImage(jpegNamed: "2014-09-23@16-13-39"),
            NSImage(jpegNamed: "2014-09-23@16-13-59"),
            NSImage(jpegNamed: "2014-09-23@16-14-19"),
            NSImage(jpegNamed: "2014-09-23@16-14-39"),
            NSImage(jpegNamed: "2014-09-23@16-14-59"),
            NSImage(jpegNamed: "2014-09-23@16-15-18"),
            NSImage(jpegNamed: "2014-09-23@16-15-38"),
            NSImage(jpegNamed: "2014-09-23@16-15-58"),
            NSImage(jpegNamed: "2014-09-23@16-16-18"),
            NSImage(jpegNamed: "2014-09-23@16-16-38"),
            NSImage(jpegNamed: "2014-09-23@16-16-58"),
            NSImage(jpegNamed: "2014-09-23@16-17-19"),
            NSImage(jpegNamed: "2014-09-23@16-17-39"),
            NSImage(jpegNamed: "2014-09-23@16-17-59"),
            NSImage(jpegNamed: "2014-09-23@16-18-18"),
            NSImage(jpegNamed: "2014-09-23@16-18-38"),
            NSImage(jpegNamed: "2014-09-23@16-18-59")
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

