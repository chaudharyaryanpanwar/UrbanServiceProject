//
//  ServiceDetailSection.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct ServiceDetailsSection: View {
    let posting: ServicePosting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(posting.serviceType)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "clock")
                Text(posting.duration)
            }
            
            HStack {
                Image(systemName: "dollarsign.circle")
                Text(posting.price)
            }
            
            Text(posting.additionalDetails)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

