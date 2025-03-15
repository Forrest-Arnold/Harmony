//
//  Channel.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import Foundation

struct Channel: Identifiable {
    var id = UUID()
    var name: String
    var isVoiceChannel: Bool
}
