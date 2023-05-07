//
//  CheckoutView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/05/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var sessionAuth = SessionAuth()
    @State private var harga = 50000
    @State private var fee = 2500
    var selectedSeats: [String]
    
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
                    Image(systemName: "film")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.white)
                    
                    VStack {
                        Text("Name Of Film")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding(.vertical)
                        Text("Action Horror")
                            .foregroundColor(.white)
                            .font(.body)
                        Text("Rating 7/10")
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
                    //
                } label: {
                    Text("Checkout Now")
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                .disabled(Int(sessionAuth.user?.wallet ?? 0) < (harga * selectedSeats.count + fee))
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(selectedSeats: ["B1", "B2"])
    }
}
