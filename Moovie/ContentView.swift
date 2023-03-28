//
//  ContentView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    
    var body: some View {
        VStack {
            UpcomingView()
            Button("Log Out") {
                sessionAuth.logout()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
