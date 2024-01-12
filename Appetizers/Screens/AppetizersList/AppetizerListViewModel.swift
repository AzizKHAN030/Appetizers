//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailPopup: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidUrl
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    }
                }
            }
        }
    }

}
