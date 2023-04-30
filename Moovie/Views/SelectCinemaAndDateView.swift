//
//  SelectCinemaAndDateView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 30/04/23.
//

import SwiftUI

struct SelectCinemaAndDateView: View {
    @State private var searchText = ""
    @State private var dropdownOn = false
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(.leading, 50)
                    }
                    Spacer()
                    
                    Text("Find place")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.trailing, 50)
                    Spacer()

                }
                
                InputFieldView(title: "", placeholder: "Enter your email address", autocapitalization: .none ,text: $searchText)
                
                Spacer()
            }
        }
    }
}

struct SelectCinemaAndDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCinemaAndDateView()
    }
}
