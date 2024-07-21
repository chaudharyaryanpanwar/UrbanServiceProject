//
//  LoginScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var rememberMe = false
    @State private var userType: UserType = .consumer
    @Binding var showLogin : Bool
    @Environment(\.colorScheme) var colorScheme
    
    enum UserType {
        case worker, consumer
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.accentColor)
                        .padding(.top, 30)
                    
                    VStack(spacing: 15) {
                        CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        CustomSecureField(icon: "lock", placeholder: "Password", text: $password, showPassword: $showPassword)
                    }
                    
                    VStack(spacing: 10) {
                        Text("I am a:")
                            .font(.headline)
                        
                        HStack(spacing: 20) {
                            UserTypeButton(title: "Worker", systemImage: "briefcase", isSelected: userType == .worker) {
                                userType = .worker
                            }
                            
                            UserTypeButton(title: "Consumer", systemImage: "person.2", isSelected: userType == .consumer) {
                                userType = .consumer
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    Button(action: {
                        // Handle login logic
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    
                    HStack {
                        Text("Don't have an account?")
                        Button("Sign Up") {
                            showLogin = false
                        }
                        .foregroundColor(.accentColor)
                    }
                    .font(.subheadline)
                    .padding(.top, 10)
                    
//                    VStack(spacing: 20) {
//                        Text("Or sign in with")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
                        
//                        HStack(spacing: 20) {
//                            SocialLoginButton(image: "google", color: .red)
//                            SocialLoginButton(image: "facebook", color: .blue)
//                            SocialLoginButton(image: "apple", color: colorScheme == .dark ? .white : .black)
//                        }
//                    }
//                    .padding(.top)
                }
                .padding()
            }
            .navigationTitle("Welcome Back")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
        LoginView(showLogin: .constant(true)).preferredColorScheme(.dark)
}
