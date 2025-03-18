//
//  UserProfileViewModel.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    
    @Published var user: ResponseUser
    
    init(user: ResponseUser) {
        self.user = user
    }
    
    func formatPhoneNumber() -> String {
        let digits = user.phone.filter { $0.isNumber }
        
        guard digits.count >= 10 else { return user.phone }
        
        let countryCode = "+\(digits.prefix(2))"
        let areaCode = digits.dropFirst(2).prefix(3)
        let firstPart = digits.dropFirst(5).prefix(3)
        let secondPart = digits.dropFirst(8).prefix(2)
        let thirdPart = digits.dropFirst(10)

        return "\(countryCode) (\(areaCode)) \(firstPart) \(secondPart) \(thirdPart)"
    }
    
}
