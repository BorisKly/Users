//
//  HomeView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
            ScrollView {
                LazyVStack(spacing: 0) {
                    
                    ForEach(viewModel.users, id: \.id) { user in
                        HStack {
                            UserProfileView(viewModel: UserProfileViewModel(user: user)).id(user.id)
                            Spacer()
                        }
                    }
                    
                    if viewModel.nextPage != nil {
                        ProgressView()
                            .padding()
                            .onAppear {
                                viewModel.loadMoreUsers()
                            }
                    }
                }
            }
            .background(Color.mainBackgroundColor)
    }
}

#Preview {
    HomeView()
}
