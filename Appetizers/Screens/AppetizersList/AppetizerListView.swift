//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers) { appetizer in
                    AppetizerListRow(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetailPopup = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetailPopup)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailPopup ? 20 : 0)
            
            if(viewModel.isShowingDetailPopup){
                AppetizerDetailsPopup(
                    appetizer: viewModel.selectedAppetizer!,
                    isShowingDetailPopup: $viewModel.isShowingDetailPopup)
            }
            
            if (viewModel.isLoading) {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}
    

#Preview {
    AppetizerListView()
}
