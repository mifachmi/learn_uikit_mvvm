//
//  PeopleViewModel.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 28/11/24.
//

import Foundation

class PeopleViewModel {
    
    private var users: [PersonResponse] = []
    
    func getUsers() {
        Task { [weak self] in
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase // Convert key from snake_case to camelCase
                
                self?.users = try jsonDecoder.decode(UsersResponse.self, from: data).data
                
            } catch {
                print(error)
            }
        }
        
    }
}
