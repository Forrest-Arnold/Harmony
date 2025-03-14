//
//  TitleRow.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct TitleRow: View {
    var body: some View {
        ServerPhoto()
            .background(Color.secondaryColor)
    }
}

struct ServerPhoto: View {
    // Use name from server
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
            Text("Chat name")
            Text(">")
                .scaleEffect(x: 0.6, y: 1.1)
            Spacer()
            ZStack {
                Ellipse()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.gray)
                Image(systemName: "magnifyingglass")
            }
        }
//        .padding(.top, 10)
        .padding(10)
    }
}


#Preview {
    TitleRow()
}
