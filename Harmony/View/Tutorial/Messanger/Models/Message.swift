//
//  Message.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import Foundation
import FirebaseFirestore

struct Message: Identifiable, Codable {
    @DocumentID var id: String?
    var messageGroupId: String
    var senderId: String
    var text: String
    var timestamp: Date
}
