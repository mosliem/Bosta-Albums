//
//  UserProfileViewModel.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Combine

class UserProfileViewModel: BaseViewModel<UserServiceProvider>, UserProfileVMProtocol {
        
    var userInfo = PassthroughSubject<UserModel, Never>()
    
    var updateAlbums = PassthroughSubject<Bool, Never>()
    
    var dataSourceInjection: (() -> Void)?
    
    private var albums: [AlbumModel] = []
    
    private var router: UserProfileRouterProtocol
    
    
    private var userId: Int = -1 {
        didSet {
            getAlbums()
        }
    }
    
    
    init(
        router: UserProfileRouterProtocol,
        provider: UserServiceProvider
    ) {
        self.router = router
        super.init(provider: provider)
    }
    
    func viewDidLoad() {

        if let dataSourceInjection {
            dataSourceInjection()
        }
        getUser()
        isLoading.send(true)
    }
    
    func didPressAlbum(at index: Int) {
        router.navigationToAlbumsList(with: index)
    }
    
    
    private func getUser() {

        provider.getUser { [weak self] result in
            self?.isLoading.send(false)
            
            switch result {
            case .success(let user):
                if let user = user {
                    self?.userInfo.send(user)
                }
                
                self?.userId = user?.id ?? 0
            case .failure(let error):
                self?.errorMessage.send(error.localizedDescription)
            }
        }
    }
    
    private func getAlbums() {
        guard userId != -1 else {
            return
        }
        
        provider.getAlbums(userID: userId) { [weak self] result in
            self?.isLoading.send(false)
            
            switch result {
            case .success(let albums):
                guard let albums else {
                    return
                }
                
                self?.albums = albums
                self?.updateAlbums.send(true)

            case .failure(let error):
                self?.errorMessage.send(error.localizedDescription)
            }
        }
    }
}

extension UserProfileViewModel: AlbumsDataSourceDelegate {
    func numberOfRows() -> Int {
        return albums.count
    }
    
    func getCellTitle(index: Int) -> String {
        return albums[index].title
    }
}
