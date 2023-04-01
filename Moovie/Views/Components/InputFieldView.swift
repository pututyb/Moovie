//
//  InputFieldView.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 01/04/23.
//

import SwiftUI

struct InputFieldView: View {
    var title: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: UITextAutocapitalizationType = .none
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white)
                .padding(.leading)
            
            TextField(placeholder, text: $text)
                .padding()
                .foregroundColor(.white)
                .accentColor(.white)
                .keyboardType(keyboardType)
                .autocapitalization(autocapitalization)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(.horizontal)
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(title: "Title", placeholder: "Placeholder", text: .constant(""))
    }
}
