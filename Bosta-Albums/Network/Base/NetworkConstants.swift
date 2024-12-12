//
//  Constants.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

struct NetworkConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
        
    enum Parameter {
        static let userID = "userId"
        static let albumID = "albumId"
    }
    
    enum Header {
        static let contentType = "Content-Type"
    }

    enum ContentType {
        static let json = "application/json"
    }
}
