//
//  OrderView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListRow(appetizer: appetizer)
                        }
                        .onDelete(perform: order.remove)
                    }
                    .listStyle(.plain)
                    
                    AddToOrderButton(title: String(format: "$%.2f - Place Order", order.totalPrice), action: {print("Order placed!")})
                }
                
                if(order.items.isEmpty){
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
}
