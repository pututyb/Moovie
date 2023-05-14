//
//  Transaction.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 12/05/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TransactionViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    func saveTransaction(transaction: Transaction) {
        do {
            let _ = try db.collection("transactions").addDocument(from: transaction)
        } catch {
            print("Error saving transaction to Firestore: \(error)")
        }
    }
}

