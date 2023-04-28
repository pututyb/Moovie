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
    @Published var showError = false
    
    private var db = Firestore.firestore()
    private var userId: String?
    
    init() {
        checkLoginStatus()
    }
    
    func checkLoginStatus() {
        if Auth.auth().currentUser != nil {
            self.fetchUser()
        } else {
            self.isLoggedIn = false
        }
    }
    
    func createUser(email: String, password: String, name: String, wallet: Int, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("error create user")
                self.showError = true
                completion(false)
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
                self.isLoggedIn = true
                completion(true)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard self != nil else { return }
            if error != nil {
                print("Error signing in: \(error!.localizedDescription)")
                self?.showError = true
                completion(false)
            } else {
                print("Signed in successfully")
                self?.isLoggedIn = true
                completion(true)
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
                    do {
                        let user = try document.data(as: User.self)
                        DispatchQueue.main.async {
                            self.user = user
                        }
                    } catch {
                        print("error: \(error)")
                    }
                } else {
                    print("document does not exist")
                }
            }
        } else {
            print("no user uid, not logged in")
        }
    }
}
