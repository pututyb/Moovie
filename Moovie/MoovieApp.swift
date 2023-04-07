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
    @StateObject var userProfiling = UserProfiling()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if sessionAuth.isLoggedIn {
                if sessionAuth.isProfilCompleted {
                    ContentView()
                        .environmentObject(sessionAuth)
                } else {
                    UserProfilingView()
                        .environmentObject(sessionAuth)
                        .environmentObject(userProfiling)
                }
            } else {
                LoginView()
                    .environmentObject(sessionAuth)
            }
        }
    }
}
