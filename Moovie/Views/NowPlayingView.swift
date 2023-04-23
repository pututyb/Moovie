//
//  NowPlayingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 17/04/23.
//

import SwiftUI
import URLImage

struct NowPlayingView: View {
    @ObservedObject var viewModel = UpcomingViewModel()
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.results, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            HStack {
                                if let posterURL = movie.posterURL {
                                    URLImage(posterURL, content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 360, height: 140)
                                            .cornerRadius(8)
                                            .overlay(
                                                ZStack(alignment: .leading) {
                                                    Color.black.opacity(0.5)
                                                    VStack {
                                                        Text(movie.title)
                                                            .font(.system(size: 24, weight: .bold))
                                                            .foregroundColor(.white)
                                                            .padding()
                                                    }
                                                }
                                            )
                                    })
                                } else {
                                    Image(systemName: "film")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 360, height: 140)
                                        .cornerRadius(8)
                                        .overlay(
                                            ZStack(alignment: .leading) {
                                                Color.black.opacity(0.5)
                                                VStack {
                                                    Text(movie.title)
                                                        .font(.system(size: 24, weight: .bold))
                                                        .foregroundColor(.white)
                                                        .padding()
                                                }
                                            }
                                        )
                                }
                            }
                            .padding(.leading)
                        }
                    }
                }
            }
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
