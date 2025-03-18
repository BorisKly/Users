//
//  AuthViewModel+registerUser.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

extension AuthViewModel {
    
    func registerUser() {
        print(#function)
        isLoading = true
        let boundary = UUID().uuidString
        let userData = UserData(name: name,
                                email: email.lowercased(),
                                phone: phone,
                                positionId: selectedId,
                                photo: selectedPhoto)
        let requestBody = createBody(userData: userData, boundary: boundary)
        NetworkService.shared.postUser(data: ["body": requestBody],
                                       settings: ["token": token],
                                       boundary: boundary) { result in
            self.isLoading = false
            switch result {
            case .success(let result):
                let json = result.json
                let statusCode = result.statusCode
                if statusCode == 201 {
                    DispatchQueue.main.async {
                        self.infoType = .successfullyRegistered
                        self.resetUser()
                    }
                }
            case .failure(let error):
                switch error {
                case .invalidUrl:
                    print("invalidURL")
                case .invalidTask:
                    print("invalidTask")
                case .invalidResponse:
                    print("invalidResponse")
                case .serverError(json: let json, statusCode: let statusCode):
                    if statusCode == 409 {
                        DispatchQueue.main.async {
                            self.infoType = .alreadyRegistered
                        }
                    }
                    if statusCode == 401 {
                        print("The token expired")
                    }
                    if statusCode == 422 {
                        print("Validation failed: one of the fields is incorrect")
                        print(json)
                    }
                case .customError(message: let message, statusCode: let statusCode):
                    print("\(statusCode): \(message) ")
                }
                print(error.localizedDescription)
            }
        }
    }
    
    private func createBody(userData: UserData, boundary: String) -> Data {
        print(#function)
        var body = Data()

        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"name\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(userData.name)\r\n".data(using: .utf8)!)
        
        // Додаємо email
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"email\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(userData.email)\r\n".data(using: .utf8)!)
        
        // Додаємо phone
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"phone\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(userData.phone)\r\n".data(using: .utf8)!)
        
        // Додаємо position_id
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"position_id\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(userData.positionId)\r\n".data(using: .utf8)!)
        
        if let photoData = userData.photo {
            let filename = "user_photo.jpg"
            let mimeType = "image/jpeg"

            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
            body.append(photoData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        if let bodyString = String(data: body, encoding: .utf8) {
            print("body:\n\(bodyString)")
        } else {
            print("Failed to convert body data to string.")
        }

        return body
    }
}
