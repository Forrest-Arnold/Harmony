//
//  Server.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation

struct Server: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var users: [User]
}
