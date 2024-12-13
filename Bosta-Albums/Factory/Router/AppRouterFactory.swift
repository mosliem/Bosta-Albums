//
//  AppRouterFactory.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

class AppRouterFactory: AppRouterFactoryProtocol {
    
    func createUserProfileRouter(
        with navigationController: UINavigationController
    ) -> any UserProfileRouterProtocol {
        return UserProfileRouter(
            navigationController: navigationController
        )
    }
}
