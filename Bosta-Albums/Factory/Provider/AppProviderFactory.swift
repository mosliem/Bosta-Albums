//
//  AppProviderFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

class AppProviderFactory: AppProviderFactoryProtocol {
    
    func createUserProfileProvider() -> UserServiceProvider {
        return UserServiceProvider()
    }
 
    func createAlbumPhotosProvider() -> AlbumPhotosServiceProvider {
        return AlbumPhotosServiceProvider()
    }

}
