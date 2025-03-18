//
//  RadioButtonView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct RadioButtonView: View {
    
    let id: Int
    let label: String
    @Binding var selectedId: Int
    
    var body: some View {
        
        Button(action: {
            self.selectedId = id
        }) {
            HStack {
                Image(systemName: self.selectedId == id ? "smallcircle.fill.circle.fill" : "circle")
                    .foregroundColor(self.selectedId == id ? Color.mainSecondaryColor : .mainTextColor)
                    .opacity(self.selectedId == id ? 1 : 0.3)
                Text(label)
                    .foregroundColor(Color.mainTextColor)
                    .opacity(0.5)
                    .font(Fonts.customBody16)
            }
            .buttonStyle(PlainButtonStyle())
        }
        
    }
}
