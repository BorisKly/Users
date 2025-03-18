//
//  HomeViewModel.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    let model = HomeModel()
    @Published var isLoading = false

    @Published var users: [ResponseUser] = []
    @Published var currentPage: Int = 1
    @Published var nextPage: String?
    @Published var previousPage: String?

    @Published var totalPages: Int = 0
    @Published var totalUsers: Int = 0
    
    init() {
//        users = model.plugUsers
        fetchUsers(page: currentPage)
    }
    
    func fetchUsers(page: Int) {
        print(#function)
        print(page)
        let data = createRequestData(page: page)

        NetworkService.shared.getUsers(data: data, settings: nil) { result in
            switch result {
            case .success(let result):
                let json = result.json
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let usersResponseData = try JSONDecoder().decode(UsersResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.users.append(contentsOf: usersResponseData.users)
                        
                        self.nextPage = usersResponseData.links.nextURL
                        self.previousPage = usersResponseData.links.prevURL
                        
                        self.totalPages = usersResponseData.totalPages
                        self.totalUsers = usersResponseData.totalUsers
                    }
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func createRequestData(page: Int) -> [String: Any] {
        let data: [String: Any] = [
            "queryParams": [
                "page": String(page),
                "count": String(model.numberOfUsersPerPage)
            ]
        ]
        return data
    }
    
    func loadMoreUsers() {
        print(#function)
        guard nextPage != nil else { return }
        isLoading = true
        
        DispatchQueue.main.async {
            if self.currentPage < self.totalPages {
                self.currentPage += 1
                self.fetchUsers(page: self.currentPage)
                self.isLoading = false
            }
        }
    }
}
