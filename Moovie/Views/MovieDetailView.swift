//
//  MovieDetailView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 18/04/23.
//

import SwiftUI
import URLImage

struct MovieDetailView: View {
    let movie: MovieData.Movie
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let posterURL = movie.posterURL {
                    URLImage(posterURL, content: { image in
                        image
                            .resizable()
                            .cornerRadius(8)
                            .frame(height: 250)
                            
                    })
                    .frame(maxWidth: .infinity)
                } else {
                    Image(systemName: "film")
                        .resizable()
                        .cornerRadius(8)
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                }
                
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(String(format: "%.1f", movie.vote_average))
                    .font(.headline)
                    .foregroundColor(Color.white)
                
                Text(movie.genre_ids.map(String.init).joined(separator: ", "))
                    .font(.headline)
                    .foregroundColor(Color.white)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MovieViewModel()
        viewModel.results = [MovieData.Movie(id: 0, title: "Sample", genre_ids: [27, 26], overview: "Sample", release_date: "2023-04-21", popularity: 9.2, poster_path: "/example_poster.jpg", vote_average: 8.5, vote_count: 100)]
        
        return MovieDetailView(movie: viewModel.results[0])
    }
}
