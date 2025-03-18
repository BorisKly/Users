//
//  ResponsePosition.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

struct PositionsResponseData: Codable {
    let success: Bool
    let positions: [ResponsePosition]
}

struct ResponsePosition: Codable {
    let id: Int
    let name: String
}
