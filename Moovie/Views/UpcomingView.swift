//
//  UpcomingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 28/03/23.
//

import SwiftUI
import URLImage

struct UpcomingView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.results, id: \.id) { movie in
                    HStack {
    //                    Text(movie.title)
    //                    Text(movie.release_date)
    //                    Text("\(movie.popularity)")
                        if let posterURL = movie.posterURL {
                            URLImage(posterURL, content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 200)
                            })
                        } else {
                            Image(systemName: "film")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
                        
    //                    Text("\(movie.vote_count)")
                    }
                    .padding()
                }
            }
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
