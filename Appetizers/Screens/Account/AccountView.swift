//
//  AccountView.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .submitLabel(.continue)
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
            .navigationTitle("👤 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss"){
                        focusedTextField = nil
                    }
                }
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear(){
            viewModel.getUser()
        }
    }
}

#Preview {
    AccountView()
}
