//
//  SessionAuth.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class SessionAuth: ObservableObject {
    @Published var user: User?
    @Published var isLoggedIn = false
    private var db = Firestore.firestore()
    
    init() {
        checkLoginStatus()
    }
    
    func checkLoginStatus() {
        if Auth.auth().currentUser != nil {
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
        }
    }
    
    func createUser(email: String, password: String, name: String, wallet: Int) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("error create user")
            } else if let result = result {
                print("User created successfully")
                self.db.collection("users").document(result.user.uid).setData([
                    "name": name,
                    "email": email,
                    "wallet": wallet
                ]) { error in
                    if error != nil {
                        print("error adding user data to firestore")
                    } else {
                        print("user data added to firestore successfully")
                    }
                }
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard self != nil else { return }
            if error != nil {
                print("Error signing in:", error!.localizedDescription)
            } else {
                print("Signed in successfully")
                self?.isLoggedIn = true
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.user = nil
        } catch let logOutError {
            print("Error Logout \(logOutError.localizedDescription)")
        }
    }
    
    
    func deleteUser() {
        if let uid = Auth.auth().currentUser?.uid {
            let usersCollection = db.collection("users").document(uid)
            
            usersCollection.delete { error in
                if let error = error {
                    print("error deleting firestore data \(error.localizedDescription)")
                } else {
                    print("Firestore data deleting successfully.")
                    Auth.auth().currentUser?.delete { error in
                        if let error = error {
                            print("error deleting user authentication data \(error.localizedDescription) ")
                        } else {
                            print("User authentication data deleted successfully.")
                            self.isLoggedIn = false
                        }
                    }
                }
            }
        }
    }
    
    func fetchUser() {
        if let uid = Auth.auth().currentUser?.uid {
            db.collection("users").document(uid).getDocument { (document, error) in
                if let document = document, document.exists {
                    if let user = try? document.data(as: User.self) {
                        self.user = user
                    }
                } else {
                    print("document does not exist")
                }
            }
        }
    }
}
