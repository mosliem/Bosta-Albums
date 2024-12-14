//
//  AlbumPhotosRouter.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 14/12/2024.
//

import UIKit

class AlbumPhotosRouter: AlbumPhotosRouterProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToPhotoViewer(with url: String) {
        
    }
    
}
