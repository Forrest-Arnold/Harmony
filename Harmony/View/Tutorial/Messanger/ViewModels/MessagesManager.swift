//
//  MessagesManager.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import Foundation
import FirebaseFirestore

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    private let db = Firestore.firestore()
    
    func fetchMessages(for messageGroupId: String) {
        db.collection("messages")
            .whereField("messageGroupId", isEqualTo: messageGroupId) // Get messages for the group
            .order(by: "timestamp", descending: false) // Order by time
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(String(describing: error))")
                    return
                }
                
                self.messages = documents.compactMap { document -> Message? in
                    do {
                        return try document.data(as: Message.self)
                    } catch {
                        print("Error decoding document into Message: \(error)")
                        return nil
                    }
                }
                
                if let lastMessage = self.messages.last {
                    self.lastMessageId = lastMessage.id ?? ""
                }
            }
    }
    
    func sendMessage(text: String, messageGroupId: String, senderId: String) {
        let newMessage = Message(messageGroupId: messageGroupId, senderId: senderId, text: text, timestamp: Date())
        
        do {
            try db.collection("messages").addDocument(from: newMessage)
            print("Message sent successfully!")
        } catch {
            print("Error adding message to Firestore: \(error.localizedDescription)")
        }
    }
}
