import Foundation
import FirebaseFirestore

class ServerManager: ObservableObject {
    private let db = Firestore.firestore()
    
    func createServer(user: User, name: String, image: String) {
        let db = Firestore.firestore()  // Get Firestore database reference
        let serverRef = db.collection("servers").document()  // Create a reference to a new document in the 'servers' collection
        
        // Prepare the data you want to save in Firestore
        let serverData: [String: Any] = [
            "name": name,  // Name of the server
            "image": image,  // Image URL or placeholder (currently an empty string in your case)
            "ownerId": user.id ?? "",  // User's ID, ensure it is non-nil, fallback to an empty string if nil
            "createdAt": Timestamp()  // Timestamp to indicate when the server was created
        ]
        
        // Save the data to Firestore
        serverRef.setData(serverData) { error in
            if let error = error {
                print("Error creating server: \(error.localizedDescription)")  // Handle error
            } else {
                print("Server created successfully!")  // Success message
            }
        }
    }

    
    func getServerById(ids: [String], completion: @escaping ([Server]) -> Void) {
        var servers: [Server] = []
        let group = DispatchGroup()
        
        for id in ids {
            group.enter()
            db.collection("servers").document(id).getDocument { document, error in
                defer { group.leave() } // 🔥 Ensures we exit even if there's an error
                
                if let error = error {
                    print("Error fetching server: \(error.localizedDescription)")
                    return
                }
                
                if let document = document, document.exists {
                    do {
                        if let server = try document.data(as: Server?.self) {
                            servers.append(server)
                        }
                    } catch {
                        print("Error decoding server: \(error)")
                    }
                }
            }
        }
        
        group.notify(queue: .main) {
            completion(servers) // 🔥 Return all fetched servers
        }
    }
    
    //    func createServerDocument(server: Server) {
    //        let db = Firestore.firestore()
    //
    //        // Convert the server object to a dictionary using Firestore's Codable support
    //        do {
    //            // Add the server to the "servers" collection
    //            try db.collection("servers").addDocument(from: server) { error in
    //                if let error = error {
    //                    print("Error adding server document: \(error)")
    //                } else {
    //                    print("Server document added successfully!")
    //                }
    //            }
    //        } catch {
    //            print("Error encoding server data: \(error)")
    //        }
    //    }
}
