//
//  NetworkError.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

enum NetworkError: Error {
    case requestFailed(Error)
    case invalidStatusCode(Int)
    case decodingFailed(Error)
    case somethingWentWrong

    var localizedDescription: String {
        switch self {
        case .requestFailed(let error):
            return "Request failed with error: \(error.localizedDescription)"
        case .invalidStatusCode(let statusCode):
            return "Invalid status code: \(statusCode)"
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .somethingWentWrong:
            return "Something went wrong. Please try again later."
        }
    }
}
