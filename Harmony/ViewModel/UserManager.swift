//
//  UserManager.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/14/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserManager: ObservableObject {
    // add func parameters
    func createUser(email: String, username: String, firstName: String, lastName: String) {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        
        // This will set the id of each user to a random id vv
        let userRef = db.collection("users").document(user.uid)
        
        // Change this to allow parameters to be entered into each area to create users dynamically
        let userData: [String: Any] = [
            "email": user.email ?? "",
            "username": "john_doe",
            "image": "profile_pic_url",
            "firstName": "John",
            "lastName": "Doe",
            "onlineStatus": "online", // Change this dynamically later
            "friends": [] // Change this dynamically later
        ]
        
        userRef.setData(userData) { error in
            if let error = error {
                print("Error creating user profile \(error.localizedDescription)")
            } else {
                print("User profile created successfully")
            }
        }
    }
}
