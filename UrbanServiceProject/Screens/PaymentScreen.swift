//
//  PaymentScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

import SwiftUI

struct PaymentView: View {
    let servicePosting: ServicePosting
    @State private var selectedPaymentMethod: PaymentMethod = .creditCard
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""
    @State private var isProcessingPayment = false
    @State private var showingConfirmation = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    enum PaymentMethod: String, CaseIterable {
        case creditCard = "Credit Card"
        case debitCard = "Debit Card"
        case upi = "UPI"
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ServiceSummary(posting: servicePosting)
                
                PaymentMethodPicker(selectedMethod: $selectedPaymentMethod)
                
                if selectedPaymentMethod == .creditCard || selectedPaymentMethod == .debitCard {
                    CardDetailsSection(cardNumber: $cardNumber, expirationDate: $expirationDate, cvv: $cvv)
                } else if selectedPaymentMethod == .upi {
                    UPISection()
                }
                
                TotalSection(amount: servicePosting.price)
                
                PayButton(action: processPayment, isProcessing: $isProcessingPayment)
            }
            .padding()
        }
        .navigationTitle("Payment")
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Payment Successful"),
                message: Text("Your payment of \(servicePosting.price) has been processed successfully."),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    func processPayment() {
    }
}


struct PaymentMethodPicker: View {
    @Binding var selectedMethod: PaymentView.PaymentMethod
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Payment Method")
                .font(.headline)
            
            Picker("Payment Method", selection: $selectedMethod) {
                ForEach(PaymentView.PaymentMethod.allCases, id: \.self) { method in
                    Text(method.rawValue).tag(method)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct CardDetailsSection: View {
    @Binding var cardNumber: String
    @Binding var expirationDate: String
    @Binding var cvv: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Card Details")
                .font(.headline)
            
            TextField("Card Number", text: $cardNumber)
                .keyboardType(.numberPad)
                .textContentType(.creditCardNumber)
            
            HStack {
                TextField("MM/YY", text: $expirationDate)
                    .keyboardType(.numberPad)
                
                TextField("CVV", text: $cvv)
                    .keyboardType(.numberPad)
                    .textContentType(.creditCardNumber)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct UPISection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("UPI")
                .font(.headline)
            
            Text("You will be redirected to UPI app to complete your payment.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct TotalSection: View {
    let amount: String
    
    var body: some View {
        HStack {
            Text("Total Amount:")
                .font(.headline)
            Spacer()
            Text(amount)
                .font(.title2)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct PayButton: View {
    let action: () -> Void
    @Binding var isProcessing: Bool
    
    var body: some View {
        Button(action: action) {
            if isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text("Pay Now")
                    .fontWeight(.semibold)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(10)
        .disabled(isProcessing)
    }
}

#Preview {
            NavigationView {
                PaymentView(servicePosting: ServicePosting(
                    serviceType: "Cleaning",
                    duration: "2 hours",
                    additionalDetails: "Deep cleaning for a 2-bedroom apartment",
                    price: "$50",
                    date: Date()
                ))
            }
            .preferredColorScheme(.light)
            
}
