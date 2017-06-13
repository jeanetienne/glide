//
// Glide
// Copyright © 2017 Jean-Étienne. All rights reserved.
//

import AppKit

extension NSImage {

    var cgImage: CGImage? {
        var rect = CGRect.init(origin: .zero, size: self.size)
        return self.cgImage(forProposedRect: &rect, context: nil, hints: nil)
    }

}
