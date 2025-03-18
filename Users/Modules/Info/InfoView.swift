//
//  InfoView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct InfoView: View {
    
    let type: InfoType
    let action: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                Image(type.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIConstants.infoViewImageWidth, height: UIConstants.infoViewImageHeight)
                
                Text(type.message.localized)
                    .font(Fonts.customHeading20)
                    .multilineTextAlignment(.center)
                
                MainButtonView(title: type.buttonTitle.localized, action: action)
            }
            .frame(maxWidth: .infinity)
            .padding()
            Spacer()
        }
        .background(Color.mainBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
}
