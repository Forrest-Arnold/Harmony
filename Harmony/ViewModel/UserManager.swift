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
    func createUser(email: String, password: String, username: String, firstName: String, lastName: String) {
        let db = Firestore.firestore()

        // ✅ Create user in Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating Firebase Auth user: \(error.localizedDescription)")
                return
            }
            
            guard let user = authResult?.user else {
                print("Error: Firebase user is nil after account creation.")
                return
            }

            // ✅ Create a user document in Firestore
            let userRef = db.collection("users").document(user.uid)
            let userData: [String: Any] = [
                "id": user.uid,
                "email": email,
                "username": username,
                "image": "profile_pic_url", // Placeholder for now
                "firstName": firstName,
                "lastName": lastName,
                "onlineStatus": "online",
                "friends": [] // Empty array for now
            ]

            userRef.setData(userData, merge: true) { error in
                if let error = error {
                    print("❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌Error creating user profile in Firestore: \(error.localizedDescription)")
                } else {
                    print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ User profile created successfully in Firestore!")
                }
            }
        }
    }
}
