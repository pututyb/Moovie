//
//  SignupView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 31/03/23.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("CREATE")
                        Text("ACCOUNT")
                    }
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                    .padding()

                    InputFieldView(title: "Full Name", placeholder: "Enter your full name", text: $fullName)
                    
                    InputFieldView(title: "Email Address", placeholder: "Enter your email address", keyboardType: .emailAddress, autocapitalization: .none, text: $email)
                    
                    InputFieldView(title: "Password", placeholder: "Enter your password", text: $password)
                    
                    InputFieldView(title: "Confirm Password", placeholder: "Re-enter your password", text: $confirmPassword)
                    
                    Button(action: {
                        sessionAuth.createUser(email: email, password: password, name: fullName, wallet: 0)
                    }) {
                        Text("Create")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
