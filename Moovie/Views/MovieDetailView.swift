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
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    if let posterURL = movie.posterURL {
                        URLImage(posterURL, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(8)
                        })
                        .frame(maxWidth: .infinity)
                    } else {
                        Image(systemName: "film")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(movie.overview)
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Release Date: \(movie.release_date)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(movie.vote_average, specifier: "%.1f")")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("\(movie.vote_count) votes")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieData.Movie(id: 0, title: "Sample Movie", overview: "Sample Overview", release_date: "2023-04-21", popularity: 9.2, poster_path: "/example_poster.jpg", vote_average: 8.5, vote_count: 100))
    }
}
