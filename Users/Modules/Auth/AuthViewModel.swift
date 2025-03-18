//
//  AuthViewModel.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
        
    let model = AuthModel()
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = "+380"

    @Published var selectedPhoto: Data? {
        didSet {
            validatePhoto()
        }
    }
    @Published var selectedId: Int = 1

    @Published var token: String = ""
    @Published var userPositions: [ResponsePosition] = []

    @Published var infoType: InfoType?
    @Published var showInfoView = false

   
    @Published var isNameValid: Bool = true
    @Published var isEmailValid: Bool = true
    @Published var isPhoneValid: Bool = true
    @Published var isPhotoValid: Bool = true
    
    @Published var isValidForm: Bool = false

    @Published var isSignUpButtonPressed = false
    
    @Published var isLoading = false
    
    @Published var isKeyboardVisible = false

    private var validationWorkItem: DispatchWorkItem?
    
    init() {
        fetchToken()
        fetchPositions()
//       userPositions = model.plugPositions
    }
    
    func checkButtonDisable() -> Bool {
       return name.isEmpty && email.isEmpty
                  && (phone.count <= 4) && (selectedPhoto == nil)
                     
    }
    
    func validateForm() {
        validateName()
        validateEmail()
        validatePhone()
        validatePhoto()
        isValidForm = (isNameValid && isEmailValid && isPhoneValid && isPhotoValid)
    }
    
    func resetUser() {
        name = ""
        email = ""
        phone = "+380"
        selectedPhoto = nil
        isSignUpButtonPressed = false
    }
    
    func validateName() {
            isNameValid = name.count >= 2 && name.count <= 20
    }
    
    func validateEmail() {
            let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: self.email.lowercased())
    }
  
    func validatePhone() {
            let phonePattern = "^\\+380\\d{9}$"
            let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phonePattern)
            isPhoneValid = phonePredicate.evaluate(with: self.phone)
    }
    
    func validatePhoto() {
        if selectedPhoto != nil {
            isPhotoValid = true
        }
    }
}


struct UserSettings: Codable {
    var token: String
}
