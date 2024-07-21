//
//  DateTimeSelectionSection.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct DateTimeSelectionSection: View {
    @Binding var selectedDate: Date
    @Binding var selectedTime: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select Date and Time")
                .font(.headline)
            
            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            
            DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    DateTimeSelectionSection(selectedDate: .constant(Date()), selectedTime: .constant(Date()))
}
