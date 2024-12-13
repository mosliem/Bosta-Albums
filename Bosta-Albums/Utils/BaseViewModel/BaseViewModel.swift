//
//  BaseViewModel.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Combine
import Moya

class BaseViewModel<Provider: APIClient>: BaseViewModelProtocol {
    typealias Service = Provider
    
    var errorMessage = CurrentValueSubject<String, Never>("")
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    
    var provider: Provider
    
    init(provider: Provider) {
        self.provider = provider
    }
}
