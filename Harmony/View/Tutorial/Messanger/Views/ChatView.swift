//
//  ChatView.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct ChatView: View {
    var messageArray = ["Hello how ya", "message tests", "golden boy"]
    var body: some View {
        TitleRow()
        
        ScrollView {
            ForEach(messageArray, id: \.self) { text in
                MessageText(message: Message(id: "12345", text: text, timestamp: Date()))
            }
        }
    }
}



#Preview {
    ChatView()
}
