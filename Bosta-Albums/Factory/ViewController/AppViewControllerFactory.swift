//
//  AppViewControllerFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

class AppViewControllerFactory: AppViewControllerFactoryProtocol {

    
    func createUserProfileVC(
        with viewModel: UserProfileViewModel
    ) -> UserProfileVC {
        return UserProfileVC(viewModel: viewModel)
    }
    
    func createAlbumPhotosVC(
        with viewModel: AlbumPhotosVM
    ) -> AlbumPhotosVC {
        return AlbumPhotosVC(viewModel: viewModel)
    }
    
    func createPhotoViewerVC(
        with viewModel: PhotoViewerVMProtocol
    ) -> PhotoViewerVC {
        return PhotoViewerVC(viewModel: viewModel)
    }
    
}
