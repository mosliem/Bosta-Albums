//
//  AppViewModelFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

protocol AppViewModelFactoryProtocol {
    func createUserProfileVM(
        router: UserProfileRouterProtocol,
        with provider: UserServiceProvider
    ) -> UserProfileViewModel
}
