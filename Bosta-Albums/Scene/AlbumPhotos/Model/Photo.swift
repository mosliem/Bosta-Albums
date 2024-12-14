//
//  Photo.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import Foundation

struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

