//
//  CheckoutView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/05/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var sessionAuth = SessionAuth()
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
                    createRow("ID Order", "22081996")
                    createRow("Seat Number", "\(selectedSeats.joined(separator: ", "))")
                    createRow("Price", "Rp 50.000 x 2")
                    createRow("Fee", "Rp 2.500 x 2")
                    createRow("Total", "Rp 105.000")
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
                        Text("Rp \(String(format: "%.0f", wallet))")
                            .foregroundColor(.green)
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
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(selectedSeats: ["B1", "B2"])
    }
}
