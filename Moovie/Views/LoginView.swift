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
    
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    
                    if sessionAuth.showError {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.red)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .overlay(
                                Text("Invalid email or password")
                                    .foregroundColor(.white)
                            )
                            .padding()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    sessionAuth.showError = false
                                }
                            }
                    }
                    Spacer()
                    
                    Text("MOOVIE")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.all)
                        
                    
                    Text("Welcome Back,\nExplorer!")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.all)

                    InputFieldView(title: "Email Address", placeholder: "Enter your email address", autocapitalization: .none ,text: $email)
                    
                    InputFieldView(title: "Password", placeholder: "Enter your password", autocapitalization: .none, isSecure: true  ,text: $password)
                    
                    Button(action: {
                        sessionAuth.login(email: email, password: password) { success in
                            if success {
                                self.showError = false
                            } else {
                                self.showError = true
                            }
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(2)
                    }
                    .padding()
                    
                    HStack(spacing: 0) {
                        Spacer()
                        Text("Don't have account! ")
                            .foregroundColor(.white)
                        NavigationLink(destination: SignupView()) {
                            Text("Sign Up")
                                .foregroundColor(.orange)
                        }
                        Spacer()
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
            .environmentObject(SessionAuth())
        
    }
}
