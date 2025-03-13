//
//  HarmonyHome.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import SwiftUI

struct HarmonyHome: View {
    var body: some View {
        ZStack(alignment: .leading) {
            BackgroundView()
            HStack(spacing: 0) {
                SideBarView()
                VStack(spacing: 0) {
                    TopBarView()
                    ChannelsView()
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct TopBarView: View {
    @State private var searchBarText = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 3) {
                Text("Channel Name")
                    .font(.title2)
                    .bold()
                Text(">")
                    .scaleEffect(x: 0.6)
            }
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 30)
                        .foregroundStyle(.white)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .opacity(0.4)
                        TextField("Search", text: $searchBarText)
                    }
                    .padding(.leading, 16)
                }
                HStack(spacing: 20) {
                    ZStack {
                        Ellipse()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.gray)
                        Image(systemName: "person.2.badge.plus.fill")
                            .resizable()
                            .frame(width: 25, height: 18)
                            .padding(.leading, 3)
                            .padding(.top, 2)
                    }
                    ZStack {
                        Ellipse()
                            .foregroundStyle(.gray)
                        Image(systemName: "calendar")
                    }
                    .frame(width: 30, height: 30)
                    .offset(x: -10)
                }
            }
            Rectangle()
                .foregroundStyle(.white)
                .opacity(0.3)
                .frame(height: 1)
                .padding(.trailing, 15)
                .padding(.top, 6)
        }
        .padding(.leading, 20)
        .padding(.top, 20)
    }
}

struct ChannelsView: View {
    var body: some View {
        VStack(spacing: 0) {
            TextChannelsView()
            VoiceChannelsView()
        }
    }
}

struct TextChannelsView: View {
    @State private var channels = 5
    @State private var openTextChannels = true

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                openTextChannels.toggle()
            } label: {
                HStack(spacing: 5) {
                    Text("v")
                        .scaleEffect(CGSize(width: 1, height: 0.6))
                        .rotationEffect(openTextChannels ? .degrees(0) : .degrees(-90))
                    Text("Text Channels")
                        .font(.system(size: 16))
                        .bold()
                }
                .foregroundStyle(.black)
            }

            if openTextChannels {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(0..<channels, id: \.self) { channel in
                        Text("# General \(channel)")
                            .padding(.vertical, 5)
                            .font(.system(size: 18))
                            .bold()
                    }
                }
                .transition(.opacity)
            }
        }
        .padding(.top, 30)
        .padding(.trailing, 150)
    }
}

struct VoiceChannelsView: View {
    @State private var channels = 4
    @State private var openVoiceChannels = true

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                openVoiceChannels.toggle()
            } label: {
                HStack(spacing: 5) {
                    Text("v")
                        .scaleEffect(CGSize(width: 1, height: 0.6))
                        .rotationEffect(openVoiceChannels ? .degrees(0) : .degrees(-90))
                    Text("Voice Channels")
                        .font(.system(size: 16))
                        .bold()
                }
                .foregroundStyle(.black)
            }

            if openVoiceChannels {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(0..<channels, id: \.self) { channel in
                        Text("# Voice \(channel)")
                            .padding(.vertical, 5)
                            .font(.system(size: 18))
                            .bold()
                    }
                }
                .transition(.opacity)
            }
        }
        .padding(.top, 20)
        .padding(.trailing, 150)
    }
}

struct SideBarView: View {
    @State private var servers = 13

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 80)
                .ignoresSafeArea()
                .foregroundStyle(Color.primaryColor)

            ScrollView {
                VStack(spacing: 10) {
                    ZStack {
                        Ellipse()
                            .frame(width: 56, height: 56)
                            .foregroundStyle(.gray)
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 3)
                            .padding(.top, 4)
                    }
                    Rectangle()
                        .frame(width: 40, height: 2)
                        .opacity(0.3)
                        .foregroundStyle(.white)
                    ForEach(0..<servers, id: \.self) { _ in
                        Ellipse()
                            .frame(width: 56, height: 56)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.top, 10)
                .padding(.leading, 10)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(Color.primaryColor)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.secondaryColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 96) // Ensuring it's positioned correctly
                .padding(.top, 40)
                .scaleEffect(x: 1.12, y: 1.12)
        }
    }
}

#Preview {
    HarmonyHome()
}
