//
//  SocialLoginButton.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct SocialLoginButton: View {
    let image: String
    let color: Color
    
    var body: some View {
        Button(action: {
            // Handle social login
        }) {
            Image(systemName: image)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color)
                .clipShape(Circle())
        }
    }
}
#Preview {
    SocialLoginButton(image: "google", color: .red)
}
