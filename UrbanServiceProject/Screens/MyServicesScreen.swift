//
//  MyServicesScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 17/07/24.
//

import SwiftUI

struct MyServicesScreen: View {
    @State private var services: [ServicePosting] = [
        ServicePosting(serviceType: "Cleaning", duration: "2 hours", additionalDetails: "Need it done today", price: "$50", date: Date()),
        ServicePosting(serviceType: "Cooking", duration: "3 hours", additionalDetails: "Vegetarian meals only", price: "$75", date: Date().addingTimeInterval(86400))
    ]
    
    @State private var isSheetPresenting : Bool =  false
    
    var body: some View {
        NavigationView {
            List(services) { service in
                ServiceRow(service: service)
            }
            .navigationTitle("My Services")
            .toolbar {
                Button(action: addNewService) {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear(perform: loadServices)
        .sheet(isPresented: $isSheetPresenting, content: {
            ServicePostingView()
        })
    }
    
    private func loadServices() {

    }
    
    private func addNewService() {
        isSheetPresenting = true
    }
}

struct ServiceRow: View {
    let service: ServicePosting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(service.serviceType)
                .font(.headline)
            HStack {
                Text("Duration: \(service.duration)")
                Spacer()
                Text("Price: \(service.price)")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            Text("Date: \(formattedDate)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Status: \(service.status.rawValue.capitalized)")
                .font(.subheadline)
                .foregroundColor(statusColor)
        }
        .padding(.vertical, 8)
    }
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: service.date)
    }
    
    private var statusColor: Color {
        switch service.status {
        case .posted:
            return .blue
        case .booked:
            return .orange
        case .completed:
            return .green
        case .paid:
            return .purple
        }
    }
}

#Preview {
        MyServicesScreen()
    }

