//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home",systemImage: "house.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account",systemImage: "person.fill")
                }
            OrderView()
                .tabItem {
                    Label("Order",systemImage: "bag.fill")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
