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
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("MOOVIE")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.all)
                    
                
                Text("Welcome Back,\nExplorer!")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.all)

                Text("Email Address")
                    .foregroundColor(.white)
                    .padding(.leading)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(.horizontal)
                    .overlay(
                        TextField("", text: $email)
                            .padding()
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .textFieldStyle(PlainTextFieldStyle())
                    )
                
                Text("Password")
                    .foregroundColor(.white)
                    .padding(.leading)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(.horizontal)
                    .overlay(
                        SecureField("", text: $password)
                            .padding()
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .textFieldStyle(PlainTextFieldStyle())
                    )
                Button(action: {
                    sessionAuth.login(email: email, password: password)
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
                
                HStack(spacing: 0) {
                    Spacer()
                    Text("Don't have account! ")
                        .foregroundColor(.white)
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.orange)
                    }
                    Spacer()
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
