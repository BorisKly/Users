//
//  SplashView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Color.mainPrimaryColor.edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                Image("MainLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95.42, height: 65.09)
                Text(GeneralConstants.logo)
                    .frame(width: 160, height: 26.35)
                    .font(.system(size: 80))
                    .minimumScaleFactor(0.1)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(Color.mainTextColor)
            }
        }
    }
}
