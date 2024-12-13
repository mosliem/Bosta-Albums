//
//  UIView+Identifier.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }
}