//
//  AlbumPhotosDataSource.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 14/12/2024.
//

import UIKit

class AlbumPhotosDataSource: NSObject, UICollectionViewDataSource {

    private weak var delegate: AlbumPhotosDataSourceDelegate?

    init(delegate: AlbumPhotosDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return delegate?.numberOfItem() ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath
        ) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        guard let photoUrl = delegate?.getCellPhoto(
            at: indexPath.item
        ) else {
            return UICollectionViewCell()
        }
        
        cell.setup(imageUrl: photoUrl)
        return cell
    }
    
}
