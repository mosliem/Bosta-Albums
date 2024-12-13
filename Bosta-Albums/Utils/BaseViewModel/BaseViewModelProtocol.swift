//
//  BaseViewModelProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Combine

protocol BaseViewModelProtocol<Provider> {
    associatedtype Provider
    
    var errorMessage: CurrentValueSubject<String, Never> { get set }
    
    var isLoading: CurrentValueSubject<Bool, Never>  { get }
}
