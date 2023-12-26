//
//  User.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, name: "Kangall", email: "test44@gmail.com")
}
