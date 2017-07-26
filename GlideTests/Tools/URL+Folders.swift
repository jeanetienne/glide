//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation

extension URL {

    static var cacheFolder: URL {
        let folderPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        return folderPath.appendingPathComponent(Bundle.tests.bundleIdentifier!)
    }

}
