//
//  AddToOrderButton.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 12/01/24.
//

import SwiftUI

struct AddToOrderButton: View {
    let title: String
    let action: ()->Void
    
    var body: some View {
        Button{
            action()
        } label: {
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.title3)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding(.bottom, 30)
    }
}

#Preview {
    AddToOrderButton(title:"Hello world", action: {print("Hola")})
}
