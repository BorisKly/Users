//
//  HeaderViewModel.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import Foundation

class HeaderViewModel: ObservableObject {
    
    var selectedTab: Int
    
    init(selectedTab: Int) {
        self.selectedTab = selectedTab
    }
 
}

