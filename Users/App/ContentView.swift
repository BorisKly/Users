//
//  ContentView.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor

    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var authViewModel = AuthViewModel()

    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                if networkMonitor.isConnected {
                    withAnimation(.easeInOut) {
                        MainTabView()
                            .environmentObject(homeViewModel)
                            .environmentObject(authViewModel)
                    }
                } else {
                    withAnimation(.easeInOut) {
                        InfoView(type: .noInternet) {
                            networkMonitor.checkConnection()
                        }
                    }
                }
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

