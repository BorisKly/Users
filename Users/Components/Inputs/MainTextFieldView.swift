//
//  MainTextFieldView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct MainTextFieldView: View {
    
    @Binding var text: String
    
    var placeholder: String
    var errorMessage: String?
    var onTextChange: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke((errorMessage != nil) ? Color.mainErrorColor :
                                    Color.mainTextColor, lineWidth: 1)
                        .opacity(0.5)
                )
                .onChange(of: text, perform: { _ in
                        onTextChange?()
                })
            if let errorMessage = errorMessage {
                 Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(Color.mainErrorColor)
            }
        }
    }
}
