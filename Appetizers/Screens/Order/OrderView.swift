//
//  OrderView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct OrderView: View {
    @State var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListRow(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                AddToOrderButton(title: "$99.99 - Place Order")
            }
            .navigationTitle("🧾 Order")
        }
    }
    
    func deleteItems (at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
