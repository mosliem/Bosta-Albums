//
//  BaseEndpoint.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Moya

protocol BaseEndpoint: TargetType {
    var baseURL: URL { get }
}

extension BaseEndpoint {
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
}
