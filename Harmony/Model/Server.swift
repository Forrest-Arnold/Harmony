//
//  Server.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation
import FirebaseFirestore

struct Server: Identifiable {
    @DocumentID var id: String?
    var name: String
    var image: String
    var users: [String]
}
