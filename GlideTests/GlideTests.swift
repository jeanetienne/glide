//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import XCTest

@testable import Glide

import AVFoundation

class GlideTests: XCTestCase {

    override func setUp() {
        super.setUp()
        TestData.createCacheFolder()
    }

    override func tearDown() {
        super.tearDown()
        TestData.removeCacheFolder()
    }

    func testBasicRender() {
        let glidingExpectation = expectation(description: "Basic render")

        let outputSize = CGRect(x: 0, y: 0, width: 640, height: 480)
        let aspectRatio = CGSize(width: 640, height: 480)
        let outputWindow = AVMakeRect(aspectRatio: aspectRatio, insideRect: outputSize).integral
        let sampleFrames = TestData.basicPaths.map {
            Frame(imagePath: $0, outputWindow: outputWindow)
        }

        let glide = Glide(frames: sampleFrames, frameRate: 5, outputSize: outputSize.size)
        let timelapsePath = URL.cacheFolder.appendingPathComponent("basic.mov")

        glide.render(at: timelapsePath, completion: { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
                glidingExpectation.fulfill()
            case .error(_):
                XCTAssertTrue(false)
            }
        })

        waitForExpectations(timeout: 30, handler: { error in
            if let error = error {
                XCTAssertTrue(false, "Expectation failed: \(error)")
            }
        })
    }

    func testCroppedBasicRender() {
        let glidingExpectation = expectation(description: "Cropped basic render")

        let outputSize = CGRect(x: 0, y: 0, width: 300, height: 300)
        let outputWindow = CGRect(x: 50, y: 50, width: 200, height: 200)
        let cropRect = CGRect(x: 180, y: 90, width: 300, height: 300)
        let sampleFrames = TestData.basicPaths.map {
            Frame(imagePath: $0,
                  outputWindow: outputWindow,
                  cropRect: cropRect,
                  backgroundColor: CGColor(red: 0.1, green: 1, blue: 0.1, alpha: 1))
        }

        let glide = Glide(frames: sampleFrames, frameRate: 5, outputSize: outputSize.size)
        let timelapsePath = URL.cacheFolder.appendingPathComponent("basic-cropped.mov")

        glide.render(at: timelapsePath, completion: { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
                glidingExpectation.fulfill()
            case .error(_):
                XCTAssertTrue(false)
            }
        })

        waitForExpectations(timeout: 30, handler: { error in
            if let error = error {
                XCTAssertTrue(false, "Expectation failed: \(error)")
            }
        })
    }

    func testShortTimelapseRender() {
        let glidingExpectation = expectation(description: "Short timelapse render")

        let framesPaths = TestData.dayTimelapsePaths

        let outputSize = CGRect(x: 0, y: 0, width: 1500, height: 1100)
        let aspectRatio = CGSize(width: 2048, height: 1365)
        let outputWindow = AVMakeRect(aspectRatio: aspectRatio, insideRect: outputSize).integral
        let sampleFrames = framesPaths.map {
            Frame(imagePath: $0, outputWindow: outputWindow, backgroundColor: CGColor(gray: 0.1, alpha: 1))

        }

        let glide = Glide(frames: sampleFrames, frameRate: 60, outputSize: outputSize.size)
        let timelapsePath = URL.cacheFolder.appendingPathComponent("short-timelapse.mov")

        glide.render(at: timelapsePath, completion: { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
                glidingExpectation.fulfill()
                print("Fulfilled expectation")
            case .error(_):
                XCTAssertTrue(false)
            }
        })

        waitForExpectations(timeout: 30, handler: { error in
            if let error = error {
                XCTAssertTrue(false, "Expectation failed: \(error)")
            }
        })
    }
    
}
