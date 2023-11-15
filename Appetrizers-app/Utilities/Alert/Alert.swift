//
//  Alert.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 18/11/23.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    static let invalidURL  = AlertItem(title: Text("Server Error"), message: Text("Issue while connecting to the server "), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"), message:Text("The data recieved from server is invalid"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server"), dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request please check your network"), dismissButton: .default(Text("OK")))
}
