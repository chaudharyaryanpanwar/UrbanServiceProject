//
//  MatchmakingAndBookingScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct BookingView: View {
    let posting: ServicePosting
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var specialInstructions = ""
    @State private var isShowingConfirmation = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Service Details
                ServiceDetailsSection(posting: posting)
                
                // Date and Time Selection
                DateTimeSelectionSection(selectedDate: $selectedDate, selectedTime: $selectedTime)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Special Instructions")
                        .font(.headline)
                    
                    TextEditor(text: $specialInstructions)
                        .frame(height: 100)
                        .padding(5)
                        .background(Color(UIColor.tertiarySystemBackground))
                        .cornerRadius(5)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                BookingButton(action: {
                    isShowingConfirmation = true
                })
            }
            .padding()
        }
        .navigationTitle("Book Service")
        .alert(isPresented: $isShowingConfirmation) {
            Alert(
                title: Text("Confirm Booking"),
                message: Text("Are you sure you want to book this service?"),
                primaryButton: .default(Text("Confirm")) {
//                    hanle bookking confirmation
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
}



#Preview {
    BookingView(posting: ServicePosting(serviceType: "Cleaning", duration: "2 hours", additionalDetails: "Need it done today", price: "$50", date: Date()))
}
