//
//  AlbumPhotosVM.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Combine
import Foundation

class AlbumPhotosVM: BaseViewModel<AlbumPhotosServiceProvider>, AlbumPhotosVMProtocol {
    
    var cancellables = Set<AnyCancellable>()
    

    var updatePhotos = PassthroughSubject<Bool, Never>()
    
    var selectedImage = PassthroughSubject<Int, Never>()
    
    var insertPhotos = PassthroughSubject<[IndexPath], Never>()

    @Published var searchBehaviorEnd: Void = ()

    @Published var searchText: String = ""
    
    var dataSourceInjection: (() -> Void)?
    
    private var albumId: Int = 0
    
    private var photos: [Photo] = []
    
    private var presentedPhotos: [String] = []
    
    private var router: AlbumPhotosRouterProtocol
    
    
    init(
        provider: AlbumPhotosServiceProvider,
        router: AlbumPhotosRouterProtocol,
        id: Int
    ) {
        self.albumId = id
        self.router = router
        super.init(provider: provider)
    }
    
    func viewDidLoad() {
        dataSourceInjection?()
        getPhotos()
        bindSearchUpdates()
    }
    
    private func getPhotos() {
        self.isLoading.send(true)
        provider.getAlbumPhotos(albumID: albumId) { [weak self] result in
            
            self?.isLoading.send(false)

            switch result {
                
            case .success(let photo):
                guard let photo, photo.count > 0 else {
                    return
                }
                self?.photos = photo
                self?.setLastPresentedPhoto()
                
            case .failure(let failure):
                self?.errorMessage.send(failure.localizedDescription)
            }
        }
    }
     
    private func bindSearchUpdates() {
        $searchText.sink { [weak self] text in
            guard !text.isEmpty else { return }
            let filtered = self?.photos
                .filter { $0.title.lowercased().contains(text.lowercased())}
                .compactMap { $0.thumbnailURL }
            self?.presentedPhotos = filtered ?? []
            self?.updatePhotos.send(true)
        }
        .store(in: &cancellables)
        
        $searchBehaviorEnd.sink { [weak self] didEnd in
            self?.setLastPresentedPhoto()
            
        }
        .store(in: &cancellables)
    }
    
    private func setLastPresentedPhoto() {
        presentedPhotos = photos.map { $0.thumbnailURL }
        updatePhotos.send(true)
    }
}

extension AlbumPhotosVM: AlbumPhotosDataSourceDelegate {
    func numberOfItem() -> Int {
        return self.presentedPhotos.count
    }
    
    func getCellPhoto(at index: Int) -> String {
        return presentedPhotos[index]
    }
}
