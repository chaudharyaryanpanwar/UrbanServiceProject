//
//  ServicePostingScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct ServicePostingView: View {
    @State private var serviceType = ""
    @State private var duration = ""
    @State private var additionalDetails = ""
    @State private var date = Date()
    @State private var price = ""
    @State private var showingServiceTypes = false
    
    @Environment(\.colorScheme) var colorScheme
    
    let serviceTypes = ["Cleaning", "Gardening", "Plumbing", "Electrical", "Painting", "Other"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Service Details")) {
                    HStack {
                        Text("Service Type")
                        Spacer()
                        Button(serviceType.isEmpty ? "Select" : serviceType) {
                            showingServiceTypes = true
                        }
                        .foregroundColor(.accentColor)
                    }
                    .actionSheet(isPresented: $showingServiceTypes) {
                        ActionSheet(title: Text("Select Service Type"),
                                    buttons: serviceTypes.map { type in
                                        .default(Text(type)) { serviceType = type }
                                    } + [.cancel()])
                    }
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    HStack {
                        Text("Duration")
                        TextField("e.g., 2 hours", text: $duration)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Price")
                        TextField("$", text: $price)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section(header: Text("Additional Details")) {
                    TextEditor(text: $additionalDetails)
                        .frame(height: 100)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                
                Section {
                    Button(action: {
                        // Handle service posting logic
                    }) {
                        Text("Post Service")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Post Service")
        }
        .accentColor(.blue)
    }
}

#Preview {
            ServicePostingView()
                .preferredColorScheme(.light)
}
