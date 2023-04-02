//
//  UserProfilingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/04/23.
//

import SwiftUI

struct UserProfilingView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    @State private var email = ""
    @State private var password = ""
    
    @State private var showError: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var tappedHelper = false
    
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
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .padding()
                        }
                    }
                    
                    Text("Select Your\nFavorite Genre")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Button(action: {
                        
                    }) {
                        Text("Horror")
                    }
                    .padding()
                    .foregroundColor(tappedHelper ? .black : .white)
                    .font(.system(size: 14, weight: .regular))
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.white, lineWidth: 1)
                            .background(tappedHelper ? Color.orange : Color("bg"))

                            
                    )
                    .padding(.leading)
                    
                    
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
                    
                    Spacer()
                }
            }
        }
    }
}

struct UserProfilingView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilingView()
            .environmentObject(SessionAuth())
    }
}
