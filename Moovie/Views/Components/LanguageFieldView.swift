//
//  LanguageFieldView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/04/23.
//

import SwiftUI

struct LanguageFieldView: View {
    let languages = ["Bahasa", "English", "Korean", "Japanese"]
    let buttonWidth: CGFloat = (UIScreen.main.bounds.width - 20 - 10 - 32) / 2
    
    let layout = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    @State private var selectedLanguages: [String] = []
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 16) {
            ForEach(languages, id: \.self) { language in
                Button(action: {
                    // Handle button tap here
                }) {
                    Spacer()
                    Text(language)
                        .frame(maxWidth: buttonWidth, maxHeight: 50)
                        .padding()
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 1)
                            
                        )
                    Spacer()
                }
                .background(selectedLanguages.contains(language) ? Color.orange : nil)
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 32)
    }
}

struct LanguageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageFieldView()
    }
}
