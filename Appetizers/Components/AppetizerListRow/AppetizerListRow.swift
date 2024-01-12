//
//  AppetizerListRow.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AppetizerListRow: View {
    let appetizer:Appetizer
    
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(width: 120, height: 90, alignment: .leading)
                .cornerRadius(8)
            VStack(alignment:.leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                Text(String(format: "$%.2f", appetizer.price))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListRow(appetizer: MockData.sampleAppetizer)
}
