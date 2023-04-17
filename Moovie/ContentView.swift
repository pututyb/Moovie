//
//  ContentView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Putut Yusri Bahtiar")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.leading)
                        
                        HStack {
                            Image(systemName: "creditcard")
                                .foregroundColor(.white)
                            
                            Text("IDR 22.523")
                                .foregroundColor(.white)
                        }
                        .padding(.leading)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.orange)
                
                Spacer()
                
                UpcomingView()
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
