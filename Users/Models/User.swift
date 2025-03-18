//
//  User.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, email, phone: String
    let position: UserPosition
    let positionID, registrationTimestamp: Int
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
}

enum UserPosition: String, Codable {
    case contentManager = "Content manager"
    case designer = "Designer"
    case lawyer = "Lawyer"
}
