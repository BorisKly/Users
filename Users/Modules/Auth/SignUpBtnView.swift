//
//  SignUpBtnView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct SignUpBtnView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
   
    var body: some View {
        
        MainButtonView(title: GeneralConstants.signUp.localized, isDisabled: viewModel.checkButtonDisable()) {
           
            viewModel.isSignUpButtonPressed = true
            
            viewModel.validateForm()
            
            if viewModel.isValidForm {
                viewModel.registerUser()
            }
        }
        
    }
}

#Preview {
    SignUpBtnView()
}
