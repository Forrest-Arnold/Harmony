//
//  User.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var email: String
    var username: String
    var image: String
    var firstName: String
    var lastName: String
    var onlineStatus: String
    var friends: [User]
}
