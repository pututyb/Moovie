//
//  CheckoutView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/05/23.
//

import SwiftUI
import URLImage

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var sessionAuth = SessionAuth()
    @State private var harga = 50000
    @State private var fee = 2500
    @State var selectedSeats: [String]
    
    let movie: MovieData.Movie
    
    @StateObject private var transactionViewModel = TransactionViewModel()
    
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
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    Text("Checkout\nMovie")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack(spacing: 30) {
                    if let posterURL = movie.posterURL {
                        URLImage(posterURL, content: { image in
                            image
                                .resizable()
                                .frame(width: 90, height: 90)
                                .foregroundColor(.white)
                        })
                    } else {
                        Image(systemName: "film")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .foregroundColor(.white)
                    }
                    
                    VStack {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding(.vertical)
                        Text(movie.genre_ids.compactMap{ genreNames[$0] }.joined(separator: ", "))
                            .foregroundColor(.white)
                            .font(.body)
                        Text(String(format: "%.1f/10", movie.vote_average))
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.white)
                    .opacity(0.8)
                    .padding()
                
                VStack(spacing: 16) {
                    createRow("Seat Number", "\(selectedSeats.joined(separator: ", "))")
                    createRow("Price", "Rp \(harga) x \(selectedSeats.count)")
                    createRow("Fee", "Rp \(fee) x \(selectedSeats.count)")
                    createRow("Total", "Rp \(harga * selectedSeats.count + fee)")
                }
                .foregroundColor(.white)
                
                Divider()
                    .frame(height: 2)
                    .background(Color.white)
                    .opacity(0.8)
                    .padding()
                
                HStack {
                    Text("Your Wallet")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    if let wallet = sessionAuth.user?.wallet {
                        let total = harga * selectedSeats.count + fee
                        let walletBalance = String(format: "%.0f", wallet)
                        let walletColor: Color = Int(walletBalance) ?? 0 >= total ? .green : .red
                        Text("Rp \(walletBalance)")
                            .foregroundColor(walletColor)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 20)
                    } else {
                        Text("Loading...")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 20)
                    }
                }
                
                Spacer()
                
                Button {
                    transactionViewModel.saveTransaction(transaction: Transaction(movieTitle: movie.title, selectedSeats: selectedSeats, totalPrice: harga * selectedSeats.count + fee, createdAt: Date()))
                } label: {
                    Text("Checkout Now")
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(selectedSeats: ["B1","B2"], movie: MovieData.Movie(id: 1, title: "Example Film", genre_ids: [12,18], overview: "Example Overview", release_date: "10-05-2023", popularity: 9.5, poster_path: "example/path.jpg", backdrop_path: "example/backpath.jpg", vote_average: 8.2, vote_count: 100))
    }
}
