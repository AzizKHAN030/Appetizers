//
//  Alert.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data recieved from server was invalid. Please contact support."), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support"), dismissButton: .default(Text("OK")))
    static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. If this persists, please contact support. "), dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Error"), message: Text("Unable to complete your request at this time. Please check your internet connection"), dismissButton: .default(Text("OK")))
    static let genericError = AlertItem(title: Text("Error"), message: Text("Something went wrong, please try again later."), dismissButton: .default(Text("OK")))
    
    func getLocalizedError (message:String) -> AlertItem {
        return AlertItem(title: Text("Error"), message: Text(message), dismissButton: .default(Text("OK")))
    }
    //MARK: - Form Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure that all fields are filled."), dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please ensure that your email is correct"), dismissButton: .default(Text("OK")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile info was successfully saved."), dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was an error saving or retrieving your profile info."), dismissButton: .default(Text("OK")))
}
