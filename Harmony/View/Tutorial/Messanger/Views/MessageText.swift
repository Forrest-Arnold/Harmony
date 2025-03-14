//
//  MessageText.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct MessageText: View {
    var message: Message
    var body: some View {
        HStack(spacing: -8) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.bottom, 10)
//                .padding(.leading, -10)
            
            VStack(alignment: .leading, spacing: -10) {
                
                HStack {
                    Text("SNESQuick")
                        .bold()
                    Text("\(message.timestamp.formatted(.dateTime))")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                
                HStack {
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 330, alignment: .leading)
            }
        }
    }
}

#Preview {
    MessageText(message: Message(id: "12345", text: "Ah snap thats a text, here we go again, ah snap thats a text, here we go again", timestamp: Date()))
}
