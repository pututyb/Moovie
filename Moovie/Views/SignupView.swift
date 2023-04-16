//
//  SignupView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 31/03/23.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var showError: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var passwordMatch: Bool {
        !password.isEmpty && password == confirmPassword
    }
    
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
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .padding()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("CREATE")
                        Text("ACCOUNT")
                    }
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    InputFieldView(title: "Full Name", placeholder: "Enter your full name", text: $name)
                    
                    InputFieldView(title: "Email Address", placeholder: "Enter your email address", keyboardType: .emailAddress, autocapitalization: .none, text: $email)
                    
                    InputFieldView(title: "Password", placeholder: "Enter your password", isSecure: true ,text: $password)
                    
                    InputFieldView(title: "Confirm Password", placeholder: "Re-enter your password", isSecure: true ,text: $confirmPassword)
                    
                    Button(action: {
                        sessionAuth.createUser(email: email, password: password, name: name, wallet: 0) { success in
                            if success {
                                self.showError = false
                            } else {
                                self.showError = true
                            }
                        }
                    }) {
                        Text("Create")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(passwordMatch ? Color.orange : Color.gray)
                            .cornerRadius(2)
                    }
                    .padding()
                    .disabled(!passwordMatch)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .environmentObject(SessionAuth())
    }
}
