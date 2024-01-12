//
//  DismissPopupButton.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 12/01/24.
//

import SwiftUI

struct DismissPopupButton: View {
    @Binding var isShowingDetailPopup: Bool
    
    var body: some View {
        Button{
            isShowingDetailPopup = false
        } label: {
            Image(systemName: "xmark")
                .frame(width: 22, height: 22)
        }
            .buttonBorderShape(.circle)
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .opacity(0.6)
            .padding(5)
            .foregroundColor(.black)
    }
}

#Preview {
    DismissPopupButton(isShowingDetailPopup: .constant(true))
}
