//
//  User.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var email: String
    var username: String
    var image: String?
    var firstName: String
    var lastName: String
    var onlineStatus: String?
    // use user id's for checking both friends and servers and store them there
    var friends: [String]?
    var servers: [String]?
}
