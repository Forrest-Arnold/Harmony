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
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ChatView()
//            LoginView()
        }
    }
}
