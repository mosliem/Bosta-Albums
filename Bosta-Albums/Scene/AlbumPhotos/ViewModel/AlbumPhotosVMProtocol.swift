//
//  AlbumPhotosVMProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Combine
import Foundation

protocol AlbumPhotosVMProtocol: BaseViewModelProtocol<AlbumPhotosServiceProvider> {
        
    var updatePhotos: PassthroughSubject<Bool, Never> { get set }
    
    var insertPhotos: PassthroughSubject<[IndexPath], Never> { get set }

    var selectedImage: PassthroughSubject<Int, Never> { get set }
        
    func viewDidLoad()
        
}
