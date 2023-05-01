//
//  Cinema.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 01/05/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Cinema: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var location: String
}
