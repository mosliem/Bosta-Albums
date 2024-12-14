//
//  UserProfileRouter.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

class UserProfileRouter: UserProfileRouterProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigationToAlbumsList(with userId: Int, _ title: String) {
        let albumPhotosVC = DIContainer.shared.AlbumPhotosDI(
            with: navigationController,
            title: title,
            id: userId
        )
        
        self.navigationController.pushViewController(
            albumPhotosVC,
            animated: true
        )
    }
}
