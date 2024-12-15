//
//  PhotoPreviewRouter.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 15/12/2024.
//

import UIKit

class PhotoViewerRouter: PhotoViewerRouterProtocol {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func share(with url: String) {
        let activityVC = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )

        if let presentedView {
            presentedView.present(activityVC, animated: true)
        }
    }
    
}
