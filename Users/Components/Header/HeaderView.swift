//
//  HeaderView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var viewModel: HeaderViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Text(viewModel.selectedTab == 0 ? GeneralConstants.workingWithGetRequest.localized :
                    GeneralConstants.workingWithPostRequest.localized)
                .font(Fonts.customHeading20)
            Spacer()
        }
    }
}
