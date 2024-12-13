//
//  AppViewModelFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

class AppViewModelFactory: AppViewModelFactoryProtocol {
    
    func createUserProfileVM(
        router: UserProfileRouterProtocol,
        with provider: UserServiceProvider
    ) ->  UserProfileViewModel {
        return  UserProfileViewModel(router: router, provider: provider)
    }
    
}
