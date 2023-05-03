//
//  CheckoutView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 03/05/23.
//

import SwiftUI

struct CheckoutView: View {
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
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
