//
//  AppViewControllerFactoryProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

protocol AppViewControllerFactoryProtocol {
    func createUserProfileVC(
        with viewModel: UserProfileViewModel
    ) -> UserProfileVC
    
    func createAlbumPhotosVC(
        with viewModel: AlbumPhotosVM
    ) -> AlbumPhotosVC
}
