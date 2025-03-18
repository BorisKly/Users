//
//  MainTabView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct MainTabView: View {
        
    @State var selectedTab = 0
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = UIColor(Color.mainTabbarColor)
    }
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(viewModel: HeaderViewModel(selectedTab: selectedTab))
                .frame(height: 56)
                .background(
                    VStack {
                        Spacer()
                        Color.mainPrimaryColor
                            .frame(height: 56)
                    }
                )
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label(GeneralConstants.users.localized, systemImage: "person.3.fill")
                            .font(Fonts.customBody16)
                    }
                    .tag(0)
                AuthView()
                    .tabItem {
                        Label(GeneralConstants.signUp.localized, systemImage: "person.crop.circle.fill.badge.plus")
                            .font(Fonts.customBody16)
                    }
                    .tag(1)
            }
            .toolbarBackground(Color.blue, for: .tabBar)
            .tint(Color.mainSecondaryColor)
        }
    }
}

#Preview {
    MainTabView()
}
