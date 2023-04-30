//
//  ContentView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionAuth: SessionAuth
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
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
                            Text("\(sessionAuth.user?.name ?? "-")")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.leading)
                            
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundColor(.white)
                                
                                Text("IDR \(sessionAuth.user?.wallet ?? 0.0)")
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
                        .padding()
                    NowPlayingView()
                    Text("Browse Movie")
                        .foregroundColor(.white)
                        .padding()
                    GenresView()
                    Text("Coming Soon")
                        .foregroundColor(.white)
                        .padding()
                    UpcomingView()
                    Spacer()
                    
                    HStack(spacing: 100) {
                        Button {
                            exit(0)
                        } label: {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .gesture(TapGesture(count: 2)
                            .onEnded {
                                exit(0)
                            }
                        )
                        
                        
                        Button {
                            //
                        } label: {
                            Image(systemName: "house")
                                .resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        
                        
                        Button {
                            //
                        } label: {
                            Image(systemName: "person")
                                .resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.orange)
                }
            }
            .navigationBarBackButtonHidden(false)
            .onAppear {
                sessionAuth.fetchUser()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionAuth())
    }
}
