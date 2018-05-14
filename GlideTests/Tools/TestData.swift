//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import AppKit

struct TestData {

    static func createCacheFolder() {
        var isDirectory: ObjCBool = true
        if !FileManager.default.fileExists(atPath: URL.cacheFolder.absoluteString, isDirectory: &isDirectory) {
            try? FileManager.default.createDirectory(at: URL.cacheFolder,
                                                     withIntermediateDirectories: true,
                                                     attributes: nil)
            print("Created folder at: \(URL.cacheFolder.absoluteString)")
        }
    }

    static func removeCacheFolder() {
        try? FileManager.default.removeItem(at: URL.cacheFolder)
    }

    static var basicPaths: [URL] {
        let paths = [
            Bundle.tests.url(forResource: "01", withExtension: "png"),
            Bundle.tests.url(forResource: "02", withExtension: "jpg"),
            Bundle.tests.url(forResource: "03", withExtension: "gif")
        ]

        return paths.compactMap { $0 }
    }

    static var sunsetTimelapsePaths: [URL] {
        let paths = [
            Bundle.tests.url(forResource: "2014-09-23@18-49-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-49-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-50-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-50-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-50-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-51-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-51-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-51-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-52-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-52-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-52-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-53-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-53-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-53-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-54-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-54-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-54-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-55-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-55-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-55-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-56-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-56-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-56-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-57-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-57-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-57-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-58-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-58-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-58-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-59-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-59-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@18-59-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-00-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-00-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-00-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-01-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-01-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-01-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-02-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-02-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-02-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-03-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-03-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-03-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-04-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-04-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-04-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-05-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-05-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-05-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-06-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-06-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-06-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-07-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-07-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-07-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-08-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-08-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-08-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-09-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-09-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-09-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-10-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-10-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-10-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-11-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-11-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-11-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-12-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-12-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-12-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-13-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-13-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-13-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-14-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-14-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-14-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-15-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-15-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-15-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-16-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-16-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-16-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-17-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-17-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-17-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-18-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-18-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-18-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-19-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-19-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-19-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-20-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-20-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-20-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-21-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-21-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-21-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-22-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-22-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-22-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-23-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-23-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-23-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-24-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-24-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-24-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-25-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-25-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-25-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-26-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-26-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-26-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-27-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-27-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-27-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-28-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-28-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-28-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-29-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-29-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-29-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-30-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-30-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-30-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-31-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-31-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-31-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-32-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-32-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-32-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-33-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-33-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-33-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-34-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-34-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-34-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-35-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-35-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-35-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-36-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-36-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-36-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-37-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-37-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-37-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-38-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-38-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-38-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-39-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-39-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-39-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-40-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-40-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-40-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-41-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-41-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-41-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-42-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-42-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-42-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-43-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-43-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-43-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-44-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-44-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-44-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-45-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-45-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-45-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-46-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-46-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-46-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-47-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-47-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-47-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-48-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-48-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-48-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-49-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-49-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-49-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-50-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-50-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-50-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-51-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-51-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-51-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-52-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-52-25", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-52-45", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-53-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-53-28", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-53-52", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-54-15", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-54-37", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-55-01", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-55-22", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-55-46", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-56-09", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-56-33", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-56-56", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-57-18", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-57-41", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-58-05", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-58-28", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-58-52", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-59-15", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@19-59-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-00-02", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-00-26", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-00-49", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-01-13", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-01-36", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-02-00", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-02-23", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@20-02-47", withExtension: "jpg")
        ]

        return paths.compactMap { $0 }
    }

    static var dayTimelapsePaths: [URL] {
        let paths = [
            Bundle.tests.url(forResource: "2014-09-23@16-02-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-02-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-03-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-03-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-03-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-04-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-04-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-04-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-05-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-05-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-05-58", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-06-18", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-06-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-06-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-07-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-07-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-07-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-08-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-08-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-08-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-09-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-09-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-09-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-10-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-10-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-10-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-11-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-11-38", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-11-58", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-12-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-12-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-12-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-13-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-13-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-13-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-14-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-14-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-14-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-15-18", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-15-38", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-15-58", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-16-18", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-16-38", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-16-58", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-17-19", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-17-39", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-17-59", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-18-18", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-18-38", withExtension: "jpg"),
            Bundle.tests.url(forResource: "2014-09-23@16-18-59", withExtension: "jpg")
        ]

        return paths.compactMap { $0 }
    }

}
