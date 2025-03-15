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
    @StateObject var userManager = UserManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(userManager)
//            ServerCreationView(serverText: .constant(""))
        }
    }
}
