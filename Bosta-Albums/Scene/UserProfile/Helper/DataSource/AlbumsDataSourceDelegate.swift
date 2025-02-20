//
//  AlbumsDataSourceDelegate.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Foundation

protocol AlbumsDataSourceDelegate: AnyObject {
    
    func numberOfRows() -> Int
        
    func getCellTitle(index: Int) -> String
    
}
