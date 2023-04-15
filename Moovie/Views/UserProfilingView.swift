//
//  UserProfilingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/04/23.
//

import SwiftUI

struct UserProfilingView: View {
    @ObservedObject var userProfiling = UserProfiling()
    @ObservedObject var sessionAuth = SessionAuth()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isProfilCompleted = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Select Your\nFavorite Genre")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.system(size: 24, weight: .semibold))
                    
                    GenreFieldView(userProfiling: userProfiling, selectedGenres: $userProfiling.selectedGenres)
                    
                    Text("Movie Language\nYou Prefer?")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.system(size: 24, weight: .semibold))
                    
                    LanguageFieldView(userProfiling: userProfiling, selectedLanguages: $userProfiling.selectedLanguages)
                    
                    Button {
                        userProfiling.saveUserProfiling { success in
                            if success {
                                isProfilCompleted = true
                            }
                        }
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(2)
                            .padding(.horizontal)
                    }
                    .padding()
                }
            }
            .navigationDestination(isPresented: $isProfilCompleted) {
                ContentView()
            }
        }
    }
}

struct UserProfilingView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilingView()
            .environmentObject(SessionAuth())
            .environmentObject(UserProfiling())
    }
}
