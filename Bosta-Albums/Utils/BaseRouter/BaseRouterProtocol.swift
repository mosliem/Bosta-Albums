//
//  BaseRouterProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

protocol BaseRouterProtocol {
    var navigationController: UINavigationController { get set }
}

extension BaseRouterProtocol {
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func push(
        _ viewController: UIViewController,
        animated: Bool = true
    ) {
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }
}
