//
//  ServerCreationView.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/15/25.
//

import SwiftUI

struct ServerCreationView: View {
    @StateObject var userManager = UserManager()
    @StateObject var serverManager = ServerManager()
    @Binding var serverText: String
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color.tertiaryColor)
            VStack {
                Text("Create Your Server")
                    .font(.title)
                    .bold()
                ZStack {
                    Ellipse()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.gray)
                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 40, height: 30)
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: 35, y: -35)
                }
                Text("Server Name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.gray)
                    TextField("My Server", text: $serverText)
                        .padding(.horizontal, 20)
                }
                .frame(width: 340, height: 50)
                .padding(.bottom, 15)
                Button {
                    // Create server
                    if serverText.isEmpty {
                        showAlert = true
                    } else {
                        guard let currentUser = userManager.currentUser else {
                            // Handle case where currentUser is nil (maybe show an alert or something)
                            print("No current user available.")
                            return
                        }
                        serverManager.createServer(user: currentUser, name: serverText, image: "")
                        showAlert = false
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 340, height: 44)
                            .foregroundStyle(.gray)
                        Text("Create server")
                            .foregroundStyle(.black)
                    }
                }

                if showAlert {
                    Text("Server name cannot be empty")
                        .foregroundStyle(.black)
                        .font(.footnote)
                }
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    ServerCreationView(serverText: .constant(""))
}
