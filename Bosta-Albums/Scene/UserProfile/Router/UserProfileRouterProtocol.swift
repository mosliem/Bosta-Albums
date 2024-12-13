//
//  UserProfileRouterProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Foundation

protocol UserProfileRouterProtocol: BaseRouterProtocol {
    func navigationToAlbumsList(with userId: Int)
}
