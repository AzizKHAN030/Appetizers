//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailPopup: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        let alertContext = AlertContext()
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
            } catch {
                if (!error.localizedDescription.isEmpty) {
                    alertItem = alertContext.getLocalizedError(message: error.localizedDescription)
                } else {
                    alertItem = AlertContext.genericError
                }
            }
            
            isLoading = false
        }
    }
}
