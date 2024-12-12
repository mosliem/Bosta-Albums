//
//  AlbumsService.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation
import Moya

enum AlbumsService {
    case getAlbums(userID: Int)
    case getSelectedAlbum(AlbumID: Int)
}

extension AlbumsService: BaseEndpoint {
    
    var path: String {
        switch self {
        case .getAlbums:
            return "albums"
        case .getSelectedAlbum:
            return "photos"

        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getAlbums(let userID):
            return .requestParameters(
                parameters: [NetworkConstants.Parameter.userID: userID],
                encoding: URLEncoding.default
            )
            
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
