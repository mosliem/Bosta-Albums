//
//  ServiceProvider.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

protocol ServiceProviderProtocol {
    func getUser(completion: @escaping (Result<UserModel?, Error>) -> Void)
    
    func getAlbums(userID: Int, completion: @escaping (Result<[AlbumModel]?, Error>) -> Void)
    
//    func getSelectedAlbum(albumID: Int, completion: @escaping (Result<[photo]?, Error>) -> Void)
    
}

class ServiceProvider: APIClient, ServiceProviderProtocol {
    
    typealias Router = AlbumsService & UserService
    
    func getUser(completion: @escaping (Result<UserModel?, any Error>) -> Void) {
        <#code#>
    }
    
    func getAlbums(userID: Int, completion: @escaping (Result<[AlbumModel]?, any Error>) -> Void) {
        <#code#>
    }
    
}
