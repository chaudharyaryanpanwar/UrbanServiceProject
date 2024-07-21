import SwiftUI

final class ServicePosting  : Identifiable {
    var id: UUID
    var serviceType: String
    var duration: String
    var additionalDetails: String
    var price: String
    var date: Date
    var status: ServiceStatus

    init(serviceType: String, duration: String, additionalDetails: String, price: String, date: Date) {
        self.id = UUID()
        self.serviceType = serviceType
        self.duration = duration
        self.additionalDetails = additionalDetails
        self.price = price
        self.date = date
        self.status = .posted
    }
}

enum ServiceStatus: String, Codable {
    case posted, booked, completed, paid
}
