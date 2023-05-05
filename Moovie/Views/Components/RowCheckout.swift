//
//  RowCheckout.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 05/05/23.
//

import SwiftUI

func createRow(_ label: String, _ value: String) -> some View {
    HStack {
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(0.6)
            .padding(.horizontal, 20)
        Text(value)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 20)
    }
}
