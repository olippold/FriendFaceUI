//
//  Friend.swift
//  FriendFace
//
//  Created by Oliver Lippold on 25/01/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    init() {
        id = UUID()
        isActive = false
        name = ""
        age = 0
        company = ""
        email = ""
        address = ""
        about = ""
        registered = ""
        tags = [String]()
        friends = [Friend]()
    }
}
