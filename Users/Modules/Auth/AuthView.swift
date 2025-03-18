//
//  AuthView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI
import PhotosUI

struct AuthView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: viewModel.isKeyboardVisible ? 140 : 0)
                
                TxtFldsGroupView()
                
                Spacer()
                
                HStack {
                    PositionsView()
                    Spacer()
                }
                
                Spacer()
                
                UploadPhotoView()
                
                Spacer()
                
                SignUpBtnView()
                
                Spacer()
            }
            .frame(maxWidth: 600, maxHeight: .infinity)
            .background(Color.mainBackgroundColor)
            .padding()
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                       object: nil,
                                                       queue: .main) { _ in
                    viewModel.isKeyboardVisible = true
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                                       object: nil,
                                                       queue: .main) { _ in
                    viewModel.isKeyboardVisible = false
                }
            }
            if viewModel.showInfoView, let type = viewModel.infoType {
                InfoView(type: type) {
                    withAnimation(.easeInOut) {
                        viewModel.infoType = nil
                        viewModel.showInfoView = false
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
        .onReceive(viewModel.$infoType) { info in
            if info != nil {
                withAnimation(.easeInOut) {
                    viewModel.showInfoView = true
                }
            }
        }
    }
}
