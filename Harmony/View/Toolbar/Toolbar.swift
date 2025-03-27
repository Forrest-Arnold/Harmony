//
//  Toolbar.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct Toolbar: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 740)
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: HarmonyHome().navigationBarBackButtonHidden()) {
                        VStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Home")
                                .font(.footnote)
                        }
                        .padding(10)
                        .padding(.bottom, 16)
                        .foregroundStyle(Color.accentColor2)
                    }
                    
                    Spacer(minLength: 60)
                    
                        VStack {
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Notifications")
                                .font(.footnote)
                        }
                        .padding(10)
                        .padding(.bottom, 16)
                        .foregroundStyle(Color.accentColor2)
                    
                    Spacer(minLength: 60)
                    
                    NavigationLink(destination: Profile().navigationBarBackButtonHidden()) {
                        VStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("You")
                                .font(.footnote)
                        }
                        .padding(10)
                        .padding(.bottom, 16)
                        .foregroundStyle(Color.accentColor2)
                    }
                    
                    Spacer()
                }
                .background(Color.tertiaryColor)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    Toolbar()
}
