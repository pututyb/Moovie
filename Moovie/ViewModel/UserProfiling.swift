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
    @Published var isProfileCompleted: Bool =  false
    private var db = Firestore.firestore()
    private var userId: String?
    
    init()  {
            if let userId = Auth.auth().currentUser?.uid {
                self.userId = userId
                checkUserProfiling()
            }
        }
    
    func checkUserProfiling() -> Bool {
        guard let userId = Auth.auth().currentUser?.uid else {
            return false
        }
        
        db.collection("users").document(userId).getDocument { snapshot, error in
            if let error = error {
                print("Error getting user profiling: \(error.localizedDescription)")
            } else if let snapshot = snapshot, snapshot.exists {
                let data = snapshot.data()
                if let isProfileCompleted = data?["isProfileCompleted"] as? Bool {
                        self.isProfileCompleted = isProfileCompleted
                }
            }
        }
        return isProfileCompleted
    }
    
    
    func saveUserProfiling(completion: @escaping (Bool) -> Void) {
        print(selectedLanguages)
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        let documentRef = db.collection("users").document(uid)
        
        documentRef.setData([
            "selectedLanguages": selectedLanguages,
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
