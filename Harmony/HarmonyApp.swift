//
//  HarmonyApp.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import SwiftUI
import Firebase

@main
struct HarmonyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
//            ServerCreationView(serverText: .constant(""))
        }
    }
}
