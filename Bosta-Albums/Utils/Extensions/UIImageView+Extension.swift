//
//  UIImageView+Extension.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func load(with url: String) {
        guard let url = URL(string: url) else {
            self.image = Images.downloadError.image
            self.contentMode = .center
            return
        }
        
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [.cacheOriginalImage]
        ) { _ in
            self.contentMode = .scaleAspectFill
        }
    }
}
