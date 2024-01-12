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
    
    func getAppetizers(){
        isLoading = true
        
        DispatchQueue.main.async {
            NetworkManager.shared.getAppetizers { [self] result in
                isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidUrl
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    }
                }
            }
        }
    }
}
