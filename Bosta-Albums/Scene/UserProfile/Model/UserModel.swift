//
//  UserModel.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

extension UserModel {
    func getFullAddress() -> String {
        guard let address else { return "Address not available" }
        
        let components = [
            address.street,
            address.suite,
            address.city,
            address.zipcode
        ].compactMap {
            $0?.trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        }
        return components.joined(separator: ", ")
    }
}

// MARK: - Address
struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}
