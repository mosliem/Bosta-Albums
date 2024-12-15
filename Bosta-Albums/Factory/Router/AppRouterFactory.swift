//
//  AppRouterFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

class AppRouterFactory: AppRouterFactoryProtocol {
    
    func createUserProfileRouter(
        with navigationController: UINavigationController
    ) -> any UserProfileRouterProtocol {
        return UserProfileRouter(
            navigationController: navigationController
        )
    }
    
    func createAlbumPhotosRouter(
        with navigationController: UINavigationController
    ) -> any AlbumPhotosRouterProtocol {
        return AlbumPhotosRouter(
            navigationController: navigationController
        )
    }
    
    func createPhotoViewerRouter(
        with navigationController: UINavigationController
    ) -> any PhotoViewerRouterProtocol {
        return PhotoViewerRouter(
            navigationController: navigationController
        )
    }
    
}
