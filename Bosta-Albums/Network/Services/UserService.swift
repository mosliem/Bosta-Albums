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
    
    case getAlbums(userID: Int)

}

extension UserService: BaseEndpoint {
    
    var path: String {
        let randomUserID = Int.random(in: 1...6)
        switch self {
        case .getUser:
            return "users/\(randomUserID)"
        case .getAlbums:
            return "albums"

        }
    }
    
    // MARK: - Here we specify which method our calls should use.
    var method: Moya.Method {
        switch self {
        case .getUser, .getAlbums:
            return .get
        }
    }
    
    // MARK: - Here we specify body parameters, objects, files etc.
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .getAlbums(let userID):
            return .requestParameters(
                parameters: [NetworkConstants.Parameter.userID: userID],
                encoding: URLEncoding.default
            )
        }
    }
    
    // MARK: -  These are the headers that our service requires.
    var headers: [String: String]? {
        return [NetworkConstants.Header.contentType : NetworkConstants.ContentType.json]
    }
}
