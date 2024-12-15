//
//  PhotoPreviewVM.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 15/12/2024.
//

import Combine
import Foundation

class PhotoViewerViewModel: PhotoViewerVMProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    
    var url: Published<String?>.Publisher { $imageURL }
    
    @Published private var imageURL: String?

    
    private var router: PhotoViewerRouterProtocol
    
    
    init(url: String?, router: PhotoViewerRouterProtocol) {
        self.imageURL = url
        self.router = router
    }
    
    func sharePhoto() {
        guard let url = imageURL, !url.isEmpty else { return }
        router.share(with: url)
    }
}
