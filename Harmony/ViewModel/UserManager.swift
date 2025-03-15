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
    @Published var currentUser: User?
    @Published var userIsLoggedIn: Bool = false  // Track login state
    private var db = Firestore.firestore()
    
    // This is the setCurrentUser function
    func setCurrentUser(completion: @escaping (User?) -> Void) {
        if let user = Auth.auth().currentUser {
            let userId = user.uid
            db.collection("users").document(userId).getDocument { document, error in
                if let error = error {
                    print("Error retrieving user data: \(error.localizedDescription)")
                    self.userIsLoggedIn = false
                    completion(nil)
                    return
                }
                
                if let document = document, document.exists {
                    print("Fetched document data: \(document.data() ?? [:])") // Log raw data
                    
                    do {
                        let fetchedUser = try document.data(as: User.self)
                        self.currentUser = fetchedUser
                        self.userIsLoggedIn = true
                        completion(fetchedUser)
                        print("Fetched user data: \(String(describing: fetchedUser))")
                    } catch {
                        print("Error decoding user data: \(error.localizedDescription)")
                        self.userIsLoggedIn = false
                        completion(nil)
                    }
                } else {
                    print("No such document or user data missing.")
                    self.userIsLoggedIn = false
                    completion(nil)
                }
            }
        } else {
            print("No user is signed in.")
            self.userIsLoggedIn = false
            completion(nil)
        }
    }
}
