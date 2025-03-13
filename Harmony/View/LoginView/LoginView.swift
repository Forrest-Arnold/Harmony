//
//  LoginView.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @StateObject var dataManager = DataManager()
    
    @State private var email = ""
    @State private var password = ""
    @State private var signInPage = true
    @State private var userIsLoggedIn = false
    @State private var colorFlip = true
    @State private var rotate = false
    
    
    var body: some View {
        ZStack {
            Color.black
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [colorFlip ? .pink : .orange, colorFlip ? .red : .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1100, height: 400)
                    .rotationEffect(.degrees(rotate ? 133 : 135))
                    .offset(y: signInPage ? -340 : -320)
                    .animation(.easeInOut, value: signInPage)
                if userIsLoggedIn {
                    ListView()
                        .environmentObject(dataManager)
                } else if signInPage {
                    loginScreen
                } else {
                    registerScreen
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var loginScreen: some View {
        VStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 268, height: 40)
                    .foregroundStyle(.black)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 240, height: 60)
                    .foregroundStyle(.white)
                Text("Harmony")
                    .foregroundStyle(.black)
                    .font(.system(size: 44, weight: .bold, design: .rounded))
            }
            .offset(y: -130)
            Text("Welcome back!")
                .foregroundStyle(.white)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .offset(x: -60, y: -100)
            
            TextField("Email", text: $email)
                .foregroundStyle(.white)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty) {
                    Text("Email")
                        .foregroundStyle(.white)
                        .bold()
                }
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundStyle(.white)
            
            SecureField("Password", text: $password)
                .foregroundStyle(.white)
                .textFieldStyle(.plain)
                .placeholder(when: password.isEmpty) {
                    Text("Password")
                        .foregroundStyle(.white)
                        .bold()
                }
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundStyle(.white)
            
            Button {
                // Take you to the sign up screen
                login()
            } label: {
                Text("Sign in")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                    )
                    .foregroundStyle(.white)
            }
            .padding(.top)
            .offset(y: 100)
            
            Button {
                // This button should change the view to a register view
                signInPage.toggle()
                colorFlip.toggle()
                rotate.toggle()
            } label: {
                Text("Don't have an acccount? Sign up")
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding(.top)
            .offset(y: 110)
        }
        .frame(width: 350)
    }
    
    var registerScreen: some View {
        VStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 268, height: 40)
                    .foregroundStyle(.black)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 240, height: 60)
                    .foregroundStyle(.white)
                Text("Harmony")
                    .foregroundStyle(.black)
                    .font(.system(size: 44, weight: .bold, design: .rounded))
            }
            .offset(y: -130)
            Text("Create an account")
                .foregroundStyle(.white)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .offset(x: -36, y: -100)
            
            TextField("Email", text: $email)
                .foregroundStyle(.white)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty) {
                    Text("Email")
                        .foregroundStyle(.white)
                        .bold()
                }
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundStyle(.white)
            
            SecureField("Password", text: $password)
                .foregroundStyle(.white)
                .textFieldStyle(.plain)
                .placeholder(when: password.isEmpty) {
                    Text("Password")
                        .foregroundStyle(.white)
                        .bold()
                }
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundStyle(.white)
            
            Button {
                register()
            } label: {
                Text("Sign up")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                    )
                    .foregroundStyle(.white)
            }
            .padding(.top)
            .offset(y: 100)
            
            Button {
                signInPage.toggle()
                colorFlip.toggle()
                rotate.toggle()
            } label: {
                Text("Already have an account? Login")
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding(.top)
            .offset(y: 110)
        }
        .frame(width: 350)
        // This code skips the login step
        //            .onAppear() {
        //                Auth.auth().addStateDidChangeListener { auth, user in
        //                    if user != nil {
        //                        userIsLoggedIn.toggle()
        //                    }
        //                }
        //            }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Login failed \(error.localizedDescription)")
            } else {
                print("Login successful! User ID: \(authResult?.user.uid ?? "Unknown")")
                userIsLoggedIn = true
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
                print(error!.localizedDescription)
                userIsLoggedIn = true
            }
        }
    }
    
    
}

#Preview {
    LoginView()
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
