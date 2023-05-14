//
//  CheckoutSuccess.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 14/05/23.
//

import SwiftUI

struct CheckoutSuccess: View {
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Circle()
                    .fill(Color("success"))
                    .frame(width: 200, height: 200)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    )
                
                Text("Happy Watching!")
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .bold))
                    .padding(.vertical)
                
                Text("You have successfully\nbought the ticket")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                   //
                } label: {
                    Text("My Tickets")
                        .frame(width: 340, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                .padding(.vertical)
                
                HStack(spacing: 0) {
                    Spacer()
                    Text("Discover new movie?")
                        .foregroundColor(.white)
                    NavigationLink(destination: ContentView()) {
                        Text(" Back Home")
                            .foregroundColor(.orange)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CheckoutSuccess_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSuccess()
    }
}
