//
//  AppViewModelFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

class AppViewModelFactory: AppViewModelFactoryProtocol {
    
    func createUserProfileVM(
        router: any UserProfileRouterProtocol,
        with provider: UserServiceProvider
    ) ->  UserProfileViewModel {
        return  UserProfileViewModel(
            router: router,
            provider: provider
        )
    }
    
    func createAlbumPhotosVM(
        router: any AlbumPhotosRouterProtocol,
        with provider: AlbumPhotosServiceProvider,
        title: String,
        albumId: Int
    ) -> AlbumPhotosVM {
        
        return AlbumPhotosVM(
            provider: provider,
            router: router,
            title: title,
            id: albumId
        )
    }
    
    
    func createPhotoViewerVM(
        router: any PhotoViewerRouterProtocol,
        url: String
    ) -> PhotoViewerVMProtocol {
        
        return PhotoViewerViewModel(
            url: url,
            router: router
        )
    }
    

}
