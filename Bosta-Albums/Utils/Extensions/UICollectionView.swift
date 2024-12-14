//
//  UICollectionView.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

extension UICollectionView {
    var numOfItems: Int {
        var items = 0
        for i in 0 ..< self.numberOfSections {
            items += self.numberOfItems(inSection: i)
        }
        return items
    }
}
