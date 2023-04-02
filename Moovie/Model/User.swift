//
//  User.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var email: String
    var wallet: Double
    var favoriteGenres: [String] = []
    var preferredLanguages: [String] = []
}
