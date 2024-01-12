//
//  AddToOrderButton.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 12/01/24.
//

import SwiftUI

struct AddToOrderButton: View {
    let title: String
    
    var body: some View {
        Button{
            
        } label: {
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.title3)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.primaryBase)
        .padding(.bottom, 30)
    }
}

#Preview {
    AddToOrderButton(title:"Hello world")
}
