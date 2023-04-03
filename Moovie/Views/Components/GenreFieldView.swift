//
//  GenreFieldView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/04/23.
//

import SwiftUI

struct GenreFieldView: View {
    
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
                    // Handle button tap here
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
        GenreFieldView()
    }
}
