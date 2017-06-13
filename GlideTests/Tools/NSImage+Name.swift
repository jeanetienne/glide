//
// GlideTests
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import AppKit

extension NSImage {

    convenience init?(jpegNamed name: String) {
        if let imageUrl = Bundle.tests.url(forResource: name, withExtension: "jpg") {
            self.init(contentsOf: imageUrl)
        } else {
            return nil
        }
    }

}
