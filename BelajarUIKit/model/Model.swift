//
//  Model.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 28/11/24.
//

import Foundation

struct UsersResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}
