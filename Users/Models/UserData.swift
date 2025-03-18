//
//  UserData.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

struct UserData: Codable {
    var name: String
    var email: String
    var phone: String
    var positionId: Int
    var photo: Data?
}
