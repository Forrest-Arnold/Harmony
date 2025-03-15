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
    @State private var username = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var signInPage = true
    @State private var userIsLoggedIn = false
    @State private var colorFlip = true
    @State private var rotate = false
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.black
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [colorFlip ? Color.tertiaryColor : Color.primary, colorFlip ? Color.secondaryColor : Color.accentColor2], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 1100, height: 400)
                            .rotationEffect(.degrees(rotate ? 133 : 135))
                            .offset(y: signInPage ? -340 : -320)
                            .animation(.easeInOut, value: signInPage)
                        
                        if signInPage {
                            LoginScreen(email: $email, password: $password, signInPage: $signInPage, colorFlip: $colorFlip, rotate: $rotate, loginAction: login)
                        } else {
                        RegisterScreen(email: $email, password: $password, username: $username, firstName: $firstName, lastName: $lastName, signInPage: $signInPage, colorFlip: $colorFlip, rotate: $rotate, registerAction: register)
                        }
                    }
                }
                .ignoresSafeArea()
                .navigationDestination(isPresented: $userIsLoggedIn) {
                    HarmonyHome()
                }
            }
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
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                userIsLoggedIn = true
            }
        }
    }
}

struct LoginScreen: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var signInPage: Bool
    @Binding var colorFlip: Bool
    @Binding var rotate: Bool
    var loginAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            AuthHeaderView(title: "Harmony")
                .offset(y: -130)
            Text("Welcome back!")
                .foregroundStyle(.white)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .offset(x: -60, y: -100)
            
            AuthTextField(placeholder: "Email", text: $email)
            AuthTextField(placeholder: "Password", text: $password, isSecure: true)
            
            AuthButton(title: "Sign in", colorFlip: $colorFlip, action: loginAction)
                .offset(y: 100)
            
            Button {
                signInPage.toggle()
                colorFlip.toggle()
                rotate.toggle()
            } label: {
                Text("Don't have an account? Sign up")
                    .bold()
                    .foregroundStyle(.white)
            }
            .offset(y: 110)
        }
        .frame(width: 350)
    }
}

struct RegisterScreen: View {
    @StateObject var userManager = UserManager()
    @Binding var email: String
    @Binding var password: String
    @Binding var username: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var signInPage: Bool
    @Binding var colorFlip: Bool
    @Binding var rotate: Bool
    
    var registerAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Create an account")
                .foregroundStyle(.white)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .offset(x: -36, y: -100)
                .padding(.top, 200)
            
            VStack {
                AuthTextField(placeholder: "Email", text: $email)
                AuthTextField(placeholder: "Password", text: $password, isSecure: true)
                AuthTextField(placeholder: "Username", text: $username)
                AuthTextField(placeholder: "First Name", text: $firstName)
                AuthTextField(placeholder: "Last Name", text: $lastName)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(.black).opacity(0.7))
            
            AuthButton(title: "Sign up", colorFlip: $colorFlip, action: registerAction)
                .offset(y: 30)
            
            Button {
                userManager.createUser(email: email, password: password, username: username, firstName: firstName, lastName: lastName)
                signInPage.toggle()
                colorFlip.toggle()
                rotate.toggle()
            } label: {
                Text("Already have an account? Login")
                    .bold()
                    .foregroundStyle(.white)
            }
            .offset(y: 50)
            .padding(.bottom, 100)
        }
        .frame(width: 350)
    }
}

struct AuthHeaderView: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 268, height: 40)
                .foregroundStyle(.black)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 240, height: 60)
                .foregroundStyle(.white)
            Text(title)
                .foregroundStyle(.black)
                .font(.system(size: 44, weight: .bold, design: .rounded))
        }
    }
}

struct AuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .foregroundStyle(.white)
                            .bold()
                    }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .foregroundStyle(.white)
                            .bold()
                    }
            }
        }
        
        Rectangle()
            .frame(width: 350, height: 1)
            .foregroundStyle(.white)
    }
}

struct AuthButton: View {
    var title: String
    @Binding var colorFlip: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .frame(width: 200, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.linearGradient(colors: [colorFlip ? Color.tertiaryColor : Color.primary, colorFlip ? Color.secondaryColor : Color.accentColor2], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .foregroundStyle(.white)
                .animation(.easeInOut(duration: 0.3), value: colorFlip)
        }
        .padding(.top)
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
