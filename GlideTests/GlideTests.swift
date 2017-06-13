//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import XCTest

@testable import Glide

class GlideTests: XCTestCase {
    
    func testGliding() {
        let sampleImages = TestData.someSampleImages
        if let glide = try? Glide(images: sampleImages) {
            let timelapsePath = URL.moviesFolder.appendingPathComponent("timelapse.mov")

            try? glide.render(at: timelapsePath)

            let fileExists = FileManager.default.fileExists(atPath: timelapsePath.absoluteString)
//            XCTAssertTrue(fileExists, "Did not find a timelapse")
        } else {
            XCTAssertTrue(false, "Could not initialize Glide")
        }
    }
    
}
