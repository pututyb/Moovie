//
//  Transaction.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 12/05/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Transaction: Identifiable, Codable {
    @DocumentID var id: String?
    var movieTitle: String
    var selectedSeats: [String]
    var totalPrice: Int
    var createdAt: Date
    
}
