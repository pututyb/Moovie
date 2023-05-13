//
//  UserProfiling.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 05/04/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class UserProfiling: ObservableObject {
    @Published var selectedLanguages: [String] = []
    @Published var selectedGenres: [String] = []
    @Published var isProfileCompleted =  false
    
    private var db = Firestore.firestore()
    private var userId: String?
    
    init()  {
        if let userId = Auth.auth().currentUser?.uid {
            self.userId = userId
            checkUserProfiling()
        }
    }
    
    
    
    func checkUserProfiling() {
        guard let userId = userId else {
            return
        }
        
        db.collection("users").document(userId).getDocument { snapshot, error in
            if let error = error {
                print("error getting user profiling: \(error.localizedDescription)")
            } else if let snapshot = snapshot, snapshot.exists {
                let data = snapshot.data()
                if let isProfileCompleted = data?["isProfileCompleted"] as? Bool {
                    DispatchQueue.main.async {
                        self.isProfileCompleted = isProfileCompleted
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isProfileCompleted = false
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.isProfileCompleted = true
                }
            }
        }
    }
    
    
    func saveUserProfiling(completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        let documentRef = db.collection("users").document(uid)
        
        documentRef.setData([
            "selectedLanguages": selectedLanguages,
            "selectedGenres": selectedGenres,
            "isProfileCompleted": true
        ], merge: true) { error in
            if let error = error {
                print("Error saving user profiling data to firestore :\(error.localizedDescription)")
                completion(false)
            } else {
                print("User profiling data saved to firestore successfully.")
                DispatchQueue.main.async {
                    self.isProfileCompleted = true
                }
                completion(true)
            }
        }
    }
}
