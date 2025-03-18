//
//  AuthViewModel+fetchToken.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

extension AuthViewModel {
   
    func fetchToken() {
        print(#function)
        NetworkService.shared.getToken { result in
            switch result {
            case .success(let result):
                let json = result.json
                let statusCode = result.statusCode
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let token = try JSONDecoder().decode(TokenResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.token = token.token
                    }
                } catch {
                    print("Error decoding TokenResponseData: \(error.localizedDescription)")
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
                    print(statusCode)
                case .customError(message: let message, statusCode: let statusCode):
                    print(statusCode)
                }
                print(error.localizedDescription)
            }
        }
    }
}
