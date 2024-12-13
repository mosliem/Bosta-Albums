//
//  AppRouterFactoryProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

protocol AppRouterFactoryProtocol {
    func createUserProfileRouter(
        with navigationController: UINavigationController
    ) -> UserProfileRouterProtocol
}
