//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import XCTest

@testable import Glide

class GlideTests: XCTestCase {
    
    func testGliding() {
        let sampleImages = TestData.dayTimelapseImages
        if let glide = try? Glide(images: sampleImages) {
            let timelapsePath = URL.moviesFolder.appendingPathComponent("timelapse.mov")

            glide.render(at: timelapsePath,
                         completion: { result in
                            switch result {
                            case .success(let path):
                                print("Successfully exported the timelapse at: \(path.path)")
                            case .error(let error):
                                print("Failed to export the timelapse: \(error)")
                            }
            }, progressHandler: { progress in
                print("Progress: \(progress.fractionCompleted)")
            })

            Thread.sleep(forTimeInterval: 2)

            let fileExists = FileManager.default.fileExists(atPath: timelapsePath.absoluteString)
            XCTAssertTrue(fileExists, "Did not find a timelapse")
        } else {
            XCTAssertTrue(false, "Could not initialize Glide")
        }
    }
    
}
