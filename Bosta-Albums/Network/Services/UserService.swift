//
//  UserService.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Moya

enum UserService {
    case getUser
}

extension UserService: BaseEndpoint {
    
    var path: String {
        let randomUserID = Int.random(in: 1...5)
        return "users/\(randomUserID)"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return [NetworkConstants.Header.contentType : NetworkConstants.ContentType.json]
    }
}
