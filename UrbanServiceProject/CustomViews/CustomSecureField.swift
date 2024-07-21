//
//  CustomSecureField.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct CustomSecureField : View {
    let icon : String
    let placeholder : String
    @Binding var text : String
    @Binding var showPassword : Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.gray)
            if showPassword {
                TextField(placeholder , text : $text)
            } else {
                SecureField(placeholder , text : $text)
            }
            Button (action : {
                showPassword.toggle()
            }) {
                Image(systemName : showPassword ? "eye.slash" : "eye" )
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .clipShape(.rect(cornerRadius: 10))
    }
}
#Preview {
    
    CustomSecureField(icon: "lock", placeholder: "Password", text: .constant("password"), showPassword: .constant(false) )
        .padding()
}
