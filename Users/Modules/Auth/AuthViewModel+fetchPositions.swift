//
//  AuthViewModel+fetchPositions.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

extension AuthViewModel {
    
    func fetchPositions() {
        print(#function)
        NetworkService.shared.getPositions { result in
            switch result {
            case .success(let result):
                let json = result.json
                let statusCode = result.statusCode
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let positionsResponseData = try JSONDecoder().decode(PositionsResponseData.self, from: jsonData)
                    self.userPositions = positionsResponseData.positions
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                switch error {
                case .invalidUrl:
                    print("statusCode")
                case .invalidTask:
                    print("statusCode")
                case .invalidResponse:
                    print("statusCode")
                case .serverError(json: let json, statusCode: let statusCode):
                    if (statusCode == 404) || (statusCode == 422) {
                        print("\(statusCode): Positions not found")
                    }
                case .customError(message: let message, statusCode: let statusCode):
                    print(message)
                }
            }
            
        }
    }
}
