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
            
            VStack(alignment: .leading) {
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
                
                Text("Now Playing")
                    .foregroundColor(.white)
                    .padding(.leading)
                NowPlayingView()
                    .padding()
                
                Text("Browse Movie")
                    .foregroundColor(.white)
                    .padding(.leading)
                GenresView()
                Text("Coming Soon")
                    .foregroundColor(.white)
                    .padding()
                UpcomingView()
                    .padding(.leading)
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
