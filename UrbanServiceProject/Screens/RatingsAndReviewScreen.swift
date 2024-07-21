//
//  RatingsAndReviewScreen.swift
//  UrbanServiceProject
//
//  Created by Aryan Panwar on 16/07/24.
//

import SwiftUI

struct RatingsAndReviewsView: View {
    let servicePosting: ServicePosting
    @State private var rating: Int = 0
    @State private var review: String = ""
    @State private var isSubmitting = false
    @State private var showingConfirmation = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Service Details
                ServiceSummary(posting: servicePosting)
                
                // Rating Section
                RatingSection(rating: $rating)
                
                // Review Section
                ReviewSection(review: $review)
                
                // Submit Button
                SubmitButton(action: submitReview, isSubmitting: $isSubmitting)
            }
            .padding()
        }
        .navigationTitle("Rate & Review")
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Thank You!"),
                message: Text("Your review has been submitted successfully."),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    func submitReview() {
        isSubmitting = true
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isSubmitting = false
            showingConfirmation = true
        }
    }
}

struct ServiceSummary: View {
    let posting: ServicePosting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(posting.serviceType)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "calendar")
                Text(posting.date, style: .date)
            }
            
            HStack {
                Image(systemName: "clock")
                Text(posting.duration)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct RatingSection: View {
    @Binding var rating: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Rate your experience")
                .font(.headline)
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(index <= rating ? .yellow : .gray)
                        .font(.largeTitle)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct ReviewSection: View {
    @Binding var review: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Write your review")
                .font(.headline)
            
            TextEditor(text: $review)
                .frame(height: 150)
                .padding(5)
                .background(Color(UIColor.tertiarySystemBackground))
                .cornerRadius(5)
            
            Text("\(review.count)/500 characters")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct SubmitButton: View {
    let action: () -> Void
    @Binding var isSubmitting: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: action) {
            if isSubmitting {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text("Submit Review")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(10)
        .disabled(isSubmitting)
    }
}

#Preview {
            NavigationView {
                RatingsAndReviewsView(servicePosting: ServicePosting(
                    serviceType: "Cleaning",
                    duration: "2 hours",
                    additionalDetails: "Deep cleaning for a 2-bedroom apartment",
                    price: "$50",
                    date: Date()
                ))
            }
            .preferredColorScheme(.dark)
}
