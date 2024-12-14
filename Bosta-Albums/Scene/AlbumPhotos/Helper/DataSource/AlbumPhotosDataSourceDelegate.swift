//
//  AlbumPhotosDataSourceProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 14/12/2024.
//

import Foundation

protocol AlbumPhotosDataSourceDelegate: AnyObject {
    func numberOfItem() -> Int
    
    func getCellPhoto(at index: Int) -> String
}
