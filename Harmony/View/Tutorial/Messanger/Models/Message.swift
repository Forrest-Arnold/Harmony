//
//  Message.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var timestamp: Date
}
