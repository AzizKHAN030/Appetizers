//
//  AppetizerDetailsPopup.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 12/01/24.
//

import SwiftUI

struct AppetizerDetailsPopup: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailPopup: Bool
    
    var body: some View {
        VStack() {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing:40){
                NutritionInfo(title: "Calories", value: String(appetizer.calories))
                NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
            }
            
            Spacer()
            
            AddToOrderButton(title: String(format: "$%.2f - Add to Cart", appetizer.price), action: {addToOrder(appetizer)})
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(DismissPopupButton(isShowingDetailPopup: $isShowingDetailPopup)
                 , alignment: .topTrailing)
    }
    
    func addToOrder(_ appetizer:Appetizer){
        order.add(appetizer)
        isShowingDetailPopup = false
    }
}

#Preview {
    AppetizerDetailsPopup(appetizer: MockData.sampleAppetizer, isShowingDetailPopup: .constant(true))
}
