//
//  MainButtonView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct MainButtonView: View {
    
    var title: String
    var backgroundColor: Color = Color.mainPrimaryColor
    var textColor: Color = Color.mainTextColor
    var cornerRadius: CGFloat = 50
    var font: Font = Fonts.customBody18
    var isDisabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(textColor)
                .frame(width: UIConstants.mainButtonWidth, height: UIConstants.mainButtonHeight)
                .background(isDisabled ? Color.mainDisableColor :  backgroundColor)
                .cornerRadius(cornerRadius)
        }
        .disabled(isDisabled)
    }
}
