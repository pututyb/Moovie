//
//  LanguageFieldView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/04/23.
//

import SwiftUI

struct LanguageFieldView: View {
    @ObservedObject var userProfiling = UserProfiling()
    @Binding var selectedLanguages: [String]
    let languages = ["Bahasa", "English", "Korean", "Japanese"]
    let buttonWidth: CGFloat = (UIScreen.main.bounds.width - 20 - 10 - 32) / 2
    
    let layout = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 16) {
            ForEach(languages, id: \.self) { language in
                Button(action: {
                    if userProfiling.selectedLanguages.contains(language) {
                        userProfiling.selectedLanguages.removeAll(where: { $0 == language})
                    } else {
                        userProfiling.selectedLanguages.append(language)
                    }
                }) {
                    Text(language)
                        .padding()
                        .frame(maxWidth: buttonWidth, maxHeight: 50)
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 1)
                                .background(selectedLanguages.contains(language) ? Color.orange : nil)
                            
                        )
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 32)
    }
}

struct LanguageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageFieldView(selectedLanguages: .constant([]))
    }
}
