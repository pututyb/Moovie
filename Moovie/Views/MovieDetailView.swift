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
    
    let genreNames = [
        28: "Action",
        12: "Adventure",
        16: "Animation",
        35: "Comedy",
        80: "Crime",
        99: "Documentary",
        18: "Drama",
        10751: "Family",
        14: "Fantasy",
        36: "History",
        27: "Horror",
        10402: "Music",
        9648: "Mystery",
        10749: "Romance",
        878: "Science Fiction",
        10770: "TV Movie",
        53: "Thriller",
        10752: "War",
        37: "Western"
    ]
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ZStack {
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
                }
                
                
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(movie.genre_ids.compactMap{ genreNames[$0] }.joined(separator: ", "))
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                
                Text(String(format: "%.1f/10", movie.vote_average))
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Storyline")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                        Text(movie.overview)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                NavigationLink(destination: ChooseSeatView(movie: movie)) {
                    Text("Continue To Book")
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                
                
                Spacer()
                HStack(spacing: 100) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .padding(.top)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                    .gesture(TapGesture(count: 2)
                        .onEnded {
                            exit(0)
                        }
                    )
                    
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .padding(.top)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                    
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "person")
                            .resizable()
                            .padding(.top)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.orange)
                .padding(.vertical)
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieData.Movie(id: 1, title: "Sample Movie Title", genre_ids: [28, 12], overview: "Sample Overview Title Description", release_date: "2023-04-21", popularity: 8.5, poster_path: "poster.jpg", backdrop_path: "backdrop.jpg", vote_average: 8.5, vote_count: 100))
    }
}
