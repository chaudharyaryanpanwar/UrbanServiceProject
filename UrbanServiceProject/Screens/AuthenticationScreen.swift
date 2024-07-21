//
//  AuthenticationScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI


struct AuthenticationView: View {
    @State private var showLogin = false
    
    var body: some View {
        if showLogin {
            LoginView(showLogin: $showLogin)
        } else {
            RegistrationView(showLogin: $showLogin)
        }
    }
}



#Preview {
    AuthenticationView()
}
