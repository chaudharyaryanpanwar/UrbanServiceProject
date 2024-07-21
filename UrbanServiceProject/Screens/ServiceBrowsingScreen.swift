//
//  ServiceBrowsingScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI



struct ServiceBrowsingView: View {
    @State private var servicePostings = [
        ServicePosting(serviceType: "Cleaning", duration: "2 hours", additionalDetails: "Need it done today", price: "$50", date: Date()),
        ServicePosting(serviceType: "Cooking", duration: "3 hours", additionalDetails: "Vegetarian meals only", price: "$75", date: Date().addingTimeInterval(86400))
    ]
    @State private var searchText = ""
    
    var filteredPostings: [ServicePosting] {
        if searchText.isEmpty {
            return servicePostings
        } else {
            return servicePostings.filter { $0.serviceType.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(filteredPostings) { posting in
                        ServicePostingRow(posting: posting)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Browse Services")
        }
        .searchable(text: $searchText, prompt: "Search services")
        
    }
}

struct ServicePostingRow: View {
    let posting: ServicePosting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(posting.serviceType)
                    .font(.headline)
                Spacer()
                Text(posting.price)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            HStack {
                Image(systemName: "clock")
                Text(posting.duration)
                Spacer()
                Image(systemName: "calendar")
                Text(posting.date, style: .date)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            Text(posting.additionalDetails)
                .font(.body)
                .lineLimit(2)
            
            Button(action: {
                // Handle apply action
            }) {
                Text("Apply")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
        ServiceBrowsingView()
}
