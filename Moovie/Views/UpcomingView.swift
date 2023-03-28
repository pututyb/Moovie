//
//  UpcomingView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 28/03/23.
//

import SwiftUI

struct UpcomingView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.results, id: \.id) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                    Text(movie.release_date)
                    Text("\(movie.popularity)")
                    Text(movie.poster_path)
                    Text("\(movie.vote_average)")
                    Text("\(movie.vote_count)")
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
