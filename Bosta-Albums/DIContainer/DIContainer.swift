//
//  DIContainer.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit

final class DIContainer {
    
    private var viewModelFactory: AppViewModelFactoryProtocol!
    private var viewControllerFactory: AppViewControllerFactoryProtocol!
    private var routerFactory: AppRouterFactoryProtocol!
    private var providerFactory: AppProviderFactoryProtocol!
    
    static let shared = DIContainer()

    private init() {}

    
    func setDependanciesFactory(
        viewModel: AppViewModelFactoryProtocol,
        viewController: AppViewControllerFactoryProtocol,
        router: AppRouterFactoryProtocol,
        provider: AppProviderFactoryProtocol
    ) {
        viewModelFactory = viewModel
        viewControllerFactory = viewController
        routerFactory = router
        providerFactory = provider
    }
}

extension DIContainer {

    func UserProfileDI(with navigationController: UINavigationController) -> UserProfileVC {
        let router = routerFactory.createUserProfileRouter(
            with: navigationController
        )
        
        let provider = providerFactory.createUserProfileProvider()
        
        let viewModel = viewModelFactory.createUserProfileVM(
            router: router,
            with: provider
        )
        
        let dataSource = AlbumsDataSource(delegate: viewModel)

        let vc = UserProfileVC(viewModel: viewModel)
        viewModel.dataSourceInjection = { [weak vc] in
            vc?.tableView.dataSource = dataSource
        }
        return vc
    }
}
