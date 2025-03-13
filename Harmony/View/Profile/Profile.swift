//
//  Profile.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/13/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Background()
            VStack(alignment: .leading, spacing: 20) {
                ProfileIcon()
                Username()
                Details()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 60)
            .padding(.leading, 20)
            Toolbar()
        }
    }
}

struct ProfileIcon: View {
    var body: some View {
        Button {
            // Open icon editor
        } label: {
            VStack(alignment: .leading) {
                ZStack {
                    Ellipse()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.white)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .foregroundStyle(.black)
    }
}

struct Username: View {
    var body: some View {
        Button {
            // Open online status editor
        } label: {
            HStack {
                Text("Username")
                    .font(.title2)
                    .bold()
                Text("v")
                    .scaleEffect(x: 1.4, y: 0.7)
            }
            .padding(.bottom, 10)
        }
        .foregroundStyle(.black)
    }
}

struct Details: View {
    var body: some View {
        VStack {
            EditProfile()
            CurrentActivity()
            MemberTime()
            FriendsList()
            Note()
        }
    }
}

struct EditProfile: View {
    var body: some View {
        Button {
            // Edit Profile
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 350, height: 42)
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Edit Profile")
                        .bold()
                }
            }
        }
        .foregroundStyle(.black)
    }
}

struct CurrentActivity: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 350, height: 130)
                .foregroundStyle(.white)
            VStack(alignment: .leading) {
                Text("Playing")
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.gray)
                        Image(systemName: "gamecontroller")
                            .resizable()
                            .frame(width: 40, height: 30)
                    }
                    VStack(alignment: .leading) {
                        Text("Medal")
                        Text("0:00:00")
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct MemberTime: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 80)
                .foregroundStyle(.white)
            VStack(alignment: .leading) {
                Text("Member Since")
                Text("May 9, 2019")
            }
            .padding(.leading, 20)
        }
    }
}

struct FriendsList: View {
    var body: some View {
        Button {
            // Open friend list
        } label: {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 60)
                    .foregroundStyle(.white)
                HStack {
                    Text("Your Friends")
                    Spacer()
                    Text(">")
                        .scaleEffect(x: 0.7, y: 1.2)
                }
                .frame(maxWidth: 308)
                .padding(.leading, 20)
            }
        }
        .foregroundStyle(.black)
    }
}

struct Note: View {
    var body: some View {
        Button {
            // Open note editor
        } label: {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 80)
                    .foregroundStyle(.white)
                VStack(alignment: .leading) {
                    Text("Note")
                    Text("*not tucker*")
                }
                .padding(.leading, 20)
            }
        }
        .foregroundStyle(.black)
    }
}

struct Background: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.yellow)
            Rectangle()
                .foregroundStyle(.gray)
                .padding(.top, 130)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Profile()
}
