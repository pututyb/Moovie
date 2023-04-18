//
//  GenresView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 17/04/23.
//

import SwiftUI

struct GenresView: View {
    
    let genres = ["Horror", "Action", "Comedy", "Fantasy", "Drama", "Crime"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genres, id: \.self) { genre in
                    VStack {
                        Button(genre) {
                            
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.orange)
                        .cornerRadius(4)
                        .padding()
                    }
                }
            }
        }
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
