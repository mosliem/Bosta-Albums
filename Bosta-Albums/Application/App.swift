//
//  App.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import UIKit

class App {
    
    let window: UIWindow
    var navigationController: UINavigationController
    
    // MARK: - Init....
    public init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        setupDIContainer()
        startSceneFlow()
    }
    
    private func setupDIContainer() {
        DIContainer.shared.setDependanciesFactory(
            viewModel: AppViewModelFactory(),
            viewController: AppViewControllerFactory(),
            router: AppRouterFactory(),
            provider: AppProviderFactory()
        )
    }
    
    private func startSceneFlow() {
        let userProfileVC = DIContainer.shared.UserProfileDI(
            with: navigationController
        )
        navigationController.setViewControllers([userProfileVC], animated: true)
    }
}
