//
//  AlbumsDataSource.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

class AlbumsDataSource: NSObject, UITableViewDataSource {
    
    private var delegate: AlbumsDataSourceDelegate
    
    init(delegate: AlbumsDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfRows()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AlbumCell.identifier,
            for: indexPath
        ) as? AlbumCell else {
            return UITableViewCell()
        }
        
        let title = delegate.getCellTitle(index: indexPath.row)
        cell.setup(title: title)
        return cell
    }
    
    
}
