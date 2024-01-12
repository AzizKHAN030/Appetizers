//
//  Order.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 13/01/24.
//

import Foundation

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Float {
        items.reduce(0, { $0 + $1.price })
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func remove (at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
