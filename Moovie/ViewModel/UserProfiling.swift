//
//  UserProfiling.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 05/04/23.
//

import Foundation
import Firebase

class UserProfiling: ObservableObject {
    @Published var selectedLanguages: [String] = []
    private var db = Firestore.firestore()
    
    func saveUserProfiling(completion: @escaping (Bool) -> Void) {
        print(selectedLanguages)
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        let documentRef = db.collection("users").document(uid)
        
        documentRef.setData([
            "selectedLanguages": selectedLanguages
        ], merge: true) { error in
            if let error = error {
                print("Error saving user profiling data to firestore :\(error.localizedDescription)")
                completion(false)
            } else {
                print("User profiling data saved to firestore successfully.")
                completion(true)
            }
        }
    }
}
