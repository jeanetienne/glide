//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import XCTest

@testable import Glide

import AVFoundation

class GlideTests: XCTestCase {
    
    func testGliding() {
        let framesPaths = TestData.sunsetTimelapsePaths

        let outputSize = CGRect(x: 0, y: 0, width: 1500, height: 1100)
        let aspectRatio = CGSize(width: 2048, height: 1365)
        let outputWindow = AVMakeRect(aspectRatio: aspectRatio, insideRect: outputSize).integral
        let sampleFrames = framesPaths.map { Glide.Frame(imagePath: $0, outputWindow: outputWindow, backgroundColor: CGColor(gray: 0.1, alpha: 1)) }

        if let glide = try? Glide(frames: sampleFrames, frameRate: 60, outputSize: outputSize.size) {
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

            Thread.sleep(forTimeInterval: 15)

            let fileExists = FileManager.default.fileExists(atPath: timelapsePath.absoluteString)
            XCTAssertTrue(fileExists, "Did not find a timelapse")
        } else {
            XCTAssertTrue(false, "Could not initialize Glide")
        }
    }
    
}
