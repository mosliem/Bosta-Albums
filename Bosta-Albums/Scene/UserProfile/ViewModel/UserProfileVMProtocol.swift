//
//  UserProfileVMProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Combine

protocol UserProfileVMProtocol: BaseViewModelProtocol<UserServiceProvider> {
    
    var userInfo: PassthroughSubject<UserModel, Never> { get set }
        
    var updateAlbums: PassthroughSubject<Bool, Never> { get set }
    
    func viewDidLoad()
    
    func didPressAlbum(at index: Int)
}
