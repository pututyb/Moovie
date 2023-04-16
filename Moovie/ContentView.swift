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
        VStack {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("John Doe")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.trailing)
                    
                    HStack {
                        Image(systemName: "creditcard")
                            .foregroundColor(.secondary)
                            .padding(.trailing)
                        
                        Text("$100")
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing)
                }
                Spacer()
            }
            .padding()
            .background(Color.orange)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
