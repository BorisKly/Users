//
//  PositionsView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct PositionsView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Text(GeneralConstants.selectYourPosition.localized)
                    .font(Fonts.customBody16)
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.userPositions, id: \.id) { position in
                        RadioButtonView(id: position.id, label: position.name, selectedId: $viewModel.selectedId)
                    }
                }
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: 600)
    }
}
