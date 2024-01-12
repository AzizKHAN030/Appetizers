//
//  AccountView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                    DatePicker("Birth Date", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                Section(header: Text("Preferences")) {
                    Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(.accentColor)
            }
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .onAppear(){
                viewModel.getUser()
            }
            .navigationTitle("👤 Account")
        }
    }
}

#Preview {
    AccountView()
}
