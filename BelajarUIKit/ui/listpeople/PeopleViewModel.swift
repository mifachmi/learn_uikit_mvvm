//
//  PeopleViewModel.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 28/11/24.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(with error: Error)
}

class PeopleViewModel {
    
    // make sure that the data is private(set) so it can't be modified from outside the class
    private(set) var users: [PersonResponse] = []
    
    // make sure that the delegate is weak to avoid retain cycle
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor // This function will run in the main
    func getUsers() {
        Task { [weak self] in
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase // Convert key from snake_case to camelCase
                
                self?.users = try jsonDecoder.decode(UsersResponse.self, from: data).data
                self?.delegate?.didFinish()
                
            } catch {
                self?.delegate?.didFail(with: error)
            }
        }
        
    }
}
