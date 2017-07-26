//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation

extension URL {

    static var moviesFolder: URL {
        return FileManager.default.urls(for: .moviesDirectory, in: .userDomainMask)[0]
    }

    static var cacheFolder: URL {
        let folderPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        return folderPath.appendingPathComponent(Bundle.tests.bundleIdentifier!)
    }

}
