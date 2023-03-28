//
//  MoovieApp.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import SwiftUI
import FirebaseCore

@main
struct MoovieApp: App {
    @StateObject var sessionAuth = SessionAuth()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if sessionAuth.isLoggedIn {
                ContentView()
                    .environmentObject(sessionAuth)
            } else {
                LoginView()
                    .environmentObject(sessionAuth)
            }
        }
    }
}
