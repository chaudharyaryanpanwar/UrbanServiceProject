//
//  UserTypeButton.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct UserTypeButton : View {
    let title : String
    let systemImage : String
    let isSelected : Bool
    let action : ()-> Void
    
    var body : some View {
        Button(action : action){
            VStack {
                Image(systemName : systemImage)
                    .font(.system(size: 30))
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(isSelected ? .white : .primary)
            .frame(width : 120 , height : 100)
            .background(isSelected ? Color.accentColor : Color(UIColor.tertiarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
            .overlay (
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentColor , lineWidth: isSelected ? 0 : 2)
            )
        }
    }
}
#Preview {
    UserTypeButton(title: "Find Work", systemImage: "briefcase", isSelected: false){}
}
