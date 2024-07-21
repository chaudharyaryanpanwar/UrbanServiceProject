//
//  LoginScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//
import SwiftUI


struct RegistrationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
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
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.accentColor)
                        .padding(.top, 30)
                    
                    VStack(spacing: 15) {
                        CustomTextField(icon: "person", placeholder: "Name", text: $name)
                        CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        CustomSecureField(icon: "lock", placeholder: "Password", text: $password, showPassword: $showPassword)
                    }
                    
                    VStack(spacing: 10) {
                        Text("I want to:")
                            .font(.headline)
                        
                        HStack(spacing: 20) {
                            UserTypeButton(title: "Find Workk", systemImage: "briefcase", isSelected: userType == .worker) {
                                userType = .worker
                            }
                            
                            UserTypeButton(title: "Hire", systemImage: "person.2", isSelected: userType == .consumer) {
                                userType = .consumer
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    Button(action: {
//                        han dle registration
                        showLogin = true
                    }) {
                        Text("Create Account")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Already have an acoount?")
                        Button("Log In") {
                            showLogin = true
                        }
                        .foregroundColor(.accentColor)
                    }
                    .font(.subheadline)
                    .padding(.top, 10)
                    .padding(.bottom , 20)
                }
                .padding()
            }
            .navigationTitle("Create Acoount")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        }
    }
}




struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(showLogin: .constant(false))
        RegistrationView(showLogin: .constant(false)).preferredColorScheme(.dark)
    }
}
