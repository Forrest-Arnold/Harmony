//
//  ChatView.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct ChatView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageText(message: message)
                        }
                    }
                    .onChange(of: messagesManager.lastMessageId) { _, newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .bottom)
                        }
                    }
                }
            }
        }
        MessageField()
            .environmentObject(messagesManager)
    }
}



#Preview {
    ChatView()
}
