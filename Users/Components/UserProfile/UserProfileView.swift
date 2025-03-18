//
//  UserProfileView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var viewModel: UserProfileViewModel
        
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            
            AsyncImage(url: URL(string: viewModel.user.photo)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: 50, maxHeight: 50)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.user.name)
                    .font(Fonts.customBody18)
                    .opacity(0.87)
                    .padding(.bottom, 4)
                Text(viewModel.user.position)
                    .lineLimit(1)
                    .font(Fonts.customBody14)
                    .opacity(0.6)
                    .padding(.bottom, 8)
                Text(viewModel.user.email)
                    .lineLimit(1)
                    .font(Fonts.customBody14)
                    .opacity(0.87)
                Text(viewModel.formatPhoneNumber())
                    .lineLimit(1)
                    .font(Fonts.customBody14)
                    .opacity(0.87)
                Divider().padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
            }
            .background(Color.mainBackgroundColor)
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
    }
}

