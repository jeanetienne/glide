//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import Foundation

extension URL {

    static var moviesFolder: URL = { () -> URL in
        return FileManager.default.urls(for: .moviesDirectory, in: .userDomainMask)[0]
    }()

}
