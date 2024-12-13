//
//  ServiceProvider.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

protocol UserServiceProviderProtocol {
    func getUser(completion: @escaping (Result<UserModel?, Error>) -> Void)
    
    func getAlbums(userID: Int, completion: @escaping (Result<[AlbumModel]?, Error>) -> Void)
}

class UserServiceProvider: APIClient, UserServiceProviderProtocol {
    
    typealias Router = UserService
    
    func getUser(completion: @escaping (Result<UserModel?, any Error>) -> Void) {
        fetchData(target: .getUser, completion: completion)
    }
    
    func getAlbums(userID: Int, completion: @escaping (Result<[AlbumModel]?, any Error>) -> Void) {
        fetchData(target: .getAlbums(userID: userID), completion: completion)
    }
    
}
