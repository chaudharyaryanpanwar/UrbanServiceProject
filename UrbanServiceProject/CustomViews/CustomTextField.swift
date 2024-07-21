//
//  CustomTextField.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI


struct CustomTextField : View {
    let icon : String
    let placeholder : String
    @Binding var text : String
    
    var body: some View {
        HStack {
            Image(systemName : icon)
                .foregroundStyle(.gray)
            TextField(placeholder , text : $text)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CustomTextField(icon: "person", placeholder: "Name", text: .constant(""))
        .padding()
}
