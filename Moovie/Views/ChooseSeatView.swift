//
//  ChooseSeatView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 02/05/23.
//

import SwiftUI
import URLImage

struct ChooseSeatView: View {
    
    let rows = ["A", "B", "C", "D"]
    let cols = ["1", "2", "3", "4"]
    
    @State var selectedSeats: [String] = []
    let movie: MovieData.Movie // Add this property to hold the movie data
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                    }
                    Spacer()
                    
                    Text(movie.title)
                        .foregroundColor(.white)
                    
                    if let backdropURL = movie.backdropPath {
                        URLImage(backdropURL, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                        })
                    } else {
                        Image(systemName: "film")
                            .resizable()
                            .foregroundColor(.gray)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                    }

                }
                .padding()
                
                
                Image("screen")
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: cols.count), spacing: 10) {
                    ForEach(rows, id: \.self) { row in
                        ForEach(cols, id: \.self) { col in
                            let seat = "\(row)\(col)"
                            Button(action: {
                                // Handle button press
                                if selectedSeats.contains(seat) {
                                    selectedSeats.removeAll(where: { $0 == seat })
                                } else {
                                    selectedSeats.append(seat)
                                }
                            }) {
                                Text(seat)
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .frame(width: 50, height: 50)
                                    .background(selectedSeats.contains(seat) ? Color.orange : Color.clear)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Next")
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                
            }
        }
    }
}


struct ChooseSeatView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatView(movie: MovieData.Movie(id: 1, title: "Sample Movie Title", genre_ids: [28, 12], overview: "Sample Overview Title Description", release_date: "2023-04-21", popularity: 8.5, poster_path: "poster.jpg", backdrop_path: "backdrop.jpg", vote_average: 8.5, vote_count: 100))
    }
}
