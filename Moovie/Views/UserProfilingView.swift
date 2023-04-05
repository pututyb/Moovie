//
//  UserProfilingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/04/23.
//

import SwiftUI

struct UserProfilingView: View {
    @State private var showError: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var tappedHelper = false
    
    @State var selectedLanguages: [String]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 34, height: 34)
                                .padding()
                        }
                    }
                    
                    Text("Select Your\nFavorite Genre")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.system(size: 24, weight: .semibold))
                    
                    GenreFieldView()
                    
                    Text("Movie Language\nYou Prefer?")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.system(size: 24, weight: .semibold))
                    
                    LanguageFieldView(selectedLanguages: selectedLanguages)
                    
                    
                    Button(action: {
                        //
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(2)
                    }
                    .padding()
                }
            }
        }
    }
}

struct UserProfilingView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilingView(selectedLanguages: ["English"])
            .environmentObject(SessionAuth())
    }
}
