//
//  GenreFieldView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/04/23.
//

import SwiftUI

struct GenreFieldView: View {
    @ObservedObject var userProfiling = UserProfiling()
    @Binding var selectedGenres: [String]
    let genres = ["Horror", "Action", "Comedy", "Fantasy", "Drama", "Crime"]
    let buttonWidth: CGFloat = (UIScreen.main.bounds.width - 20 - 10 - 32) / 2
    
    let layout = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 16) {
            ForEach(genres, id: \.self) { genre in
                Button(action: {
                    if userProfiling.selectedGenres.contains(genre) {
                        userProfiling.selectedGenres.removeAll(where: { $0 == genre})
                    } else {
                        userProfiling.selectedGenres.append(genre)
                    }
                }) {
                    Spacer()
                    Text(genre)
                        .frame(maxWidth: buttonWidth, maxHeight: 50)
                        .padding()
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 1)
                                .background(selectedGenres.contains(genre) ? Color.orange : nil )
                        )
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 32)
    }
}

struct GenreFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GenreFieldView(selectedGenres: .constant([]))
    }
}
