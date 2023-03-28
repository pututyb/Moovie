//
//  LoginView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button("Login") {
                    sessionAuth.login(email: email, password: password)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
