//
//  AppProviderFactoryProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Moya

protocol AppProviderFactoryProtocol {
    func createUserProfileProvider() -> UserServiceProvider
    func createAlbumPhotosProvider() -> AlbumPhotosServiceProvider
}
