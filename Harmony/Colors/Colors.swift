//
//  Colors.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: Double
        switch hex.count {
        case 6: // RGB (No Alpha)
            (a, r, g, b) = (1, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        case 8: // ARGB
            (a, r, g, b) = (Double((int >> 24) & 0xFF) / 255, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        default:
            (a, r, g, b) = (1, 0, 0, 0) // Default to black if invalid
        }
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    // Theme colors
    static let primaryColor = Color(hex: "#2C0703")
    static let secondaryColor = Color(hex: "#890620")
    static let tertiaryColor = Color(hex: "#B6465F")
    static let accentColor1 = Color(hex: "#DA9F93")
    static let accentColor2 = Color(hex: "#EBD4CB")
    static let themeGray1 = Color(hex: "#2D2D2D")
    static let themeGray2 = Color(hex: "#6B6B6B")
    static let themeGray3 = Color(hex: "#D4D4D4")
}

