//
//  User.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable {
    @DocumentID var id: String?
    var email: String
    var password: String
    var username: String
    var image: String
    var firstName: String
    var lastName: String
    var onlineStatus: String
    var friends: [String]
    var servers: [String]
}
