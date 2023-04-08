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
                if userProfiling.isProfileCompleted {
                    ContentView()
                        .environmentObject(sessionAuth)
                        .environmentObject(userProfiling)
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
