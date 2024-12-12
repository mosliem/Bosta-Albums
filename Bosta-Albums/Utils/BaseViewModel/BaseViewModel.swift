//
//  BaseViewModel.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Combine
import Moya

class BaseViewModel<Provider: APIClient, Service: BaseEndpoint>: BaseViewModelProtocol {
    var errorMessage = CurrentValueSubject<String, Never>("")
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    
    private var provider: Provider
    
    init(provider: Provider) {
        self.provider = provider
    }
}
