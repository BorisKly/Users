//
//  UserResponseData.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

struct UsersResponseData: Codable {
    let success: Bool
    let totalPages, totalUsers, count, page: Int
    let links: Links
    let users: [ResponseUser]

    enum CodingKeys: String, CodingKey {
        case success
        case totalPages = "total_pages"
        case totalUsers = "total_users"
        case count, page, links, users
    }
}

struct Links: Codable {
    let nextURL, prevURL: String?

    enum CodingKeys: String, CodingKey {
        case nextURL = "next_url"
        case prevURL = "prev_url"
    }
}

struct ResponseUser: Codable, Identifiable {
    let id: Int
    let name, email, phone: String
    let position: String
    let positionID, registrationTimestamp: Int
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
}


