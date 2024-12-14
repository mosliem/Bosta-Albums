//
//  AlbumsService.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Moya

enum AlbumsService {
    case getSelectedAlbum(albumID: Int)
}

extension AlbumsService: BaseEndpoint {
    
    var path: String {
        return "photos"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getSelectedAlbum(let albumID):
            return .requestParameters(
                parameters: [NetworkConstants.Parameter.albumID: albumID],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String: String]? {
        return [NetworkConstants.Header.contentType : NetworkConstants.ContentType.json]
    }
}
