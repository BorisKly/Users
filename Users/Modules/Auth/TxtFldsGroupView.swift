//
//  TxtFldsGroupView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct TxtFldsGroupView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack(spacing: viewModel.isKeyboardVisible ? 10 : 30) {
            
            MainTextFieldView(text: $viewModel.name,
                              placeholder: GeneralConstants.yourName.localized,
                          errorMessage: (viewModel.isNameValid) ? nil :
                                (viewModel.name.isEmpty ? GeneralConstants.requiredField.localized : GeneralConstants.invalidName.localized)) {
                if viewModel.isSignUpButtonPressed {
                    viewModel.validateName()
                }
            }
            
            MainTextFieldView(text: $viewModel.email,
                              placeholder: GeneralConstants.email.localized,
                          errorMessage: (viewModel.isEmailValid) ? nil :
                                (viewModel.email.isEmpty ? GeneralConstants.requiredField.localized : GeneralConstants.invalidEmail.localized)) {
                if viewModel.isSignUpButtonPressed {
                    viewModel.validateEmail()
                }
            }
            
            MainTextFieldView(text: $viewModel.phone,
                              placeholder: GeneralConstants.phone.localized,
                          errorMessage: (viewModel.isPhoneValid) ? nil : 
                                (viewModel.phone.count == 4 ? GeneralConstants.requiredField.localized : GeneralConstants.invalidPhone.localized)) {
                if viewModel.isSignUpButtonPressed {
                    viewModel.validatePhone()
                }
            }
        }
    }
}
