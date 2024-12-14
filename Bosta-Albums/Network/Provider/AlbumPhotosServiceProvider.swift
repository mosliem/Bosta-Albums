//
//  AlbumPhotosServiceProvider.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Foundation

protocol AlbumPhotosServiceProviderProtocol {
    func getAlbumPhotos(
        albumID: Int,
        completion: @escaping (Result<[Photo]?, Error>) -> Void
    )
}

class AlbumPhotosServiceProvider: APIClient, AlbumPhotosServiceProviderProtocol {
    typealias Router = AlbumsService
    
    func getAlbumPhotos(
        albumID: Int,
        completion: @escaping (Result<[Photo]?, any Error>) -> Void
    ) {
        fetchData(
            target: .getSelectedAlbum(albumID: albumID ),
            completion: completion
        )
    }
}
