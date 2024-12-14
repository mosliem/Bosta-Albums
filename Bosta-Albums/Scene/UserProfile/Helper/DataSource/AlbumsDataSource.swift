//
//  AlbumsDataSource.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

class AlbumsDataSource: NSObject, UITableViewDataSource {
    
    private weak var delegate: AlbumsDataSourceDelegate?
    
    init(delegate: AlbumsDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfRows() ?? 0
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
        
        guard let title = delegate?.getCellTitle(index: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.setup(title: title)
        return cell
    }
    
    
}
