//
//  Images.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

enum Images: String {
    case downloadError = "download_error"
}

extension Images {
    var image: UIImage? {
        switch self {
        case .downloadError:
            return UIImage(named: self.rawValue)
        }
    }
}
