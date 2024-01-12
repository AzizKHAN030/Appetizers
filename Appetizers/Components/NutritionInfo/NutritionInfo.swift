//
//  AppetizerDetail.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 12/01/24.
//

import SwiftUI

struct NutritionInfo: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing:5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfo(title:"Calories" , value: String(MockData.sampleAppetizer.calories))
}
