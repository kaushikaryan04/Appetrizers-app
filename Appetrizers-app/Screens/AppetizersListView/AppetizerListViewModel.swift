//
//  AppetizerListViewModel.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 18/11/23.
//


import SwiftUI

final class AppetizerListViewModel : ObservableObject{
    
//    @StateObject var 
    @Published var appetizers: [Appetizer] = [];
    
    @Published var alertItem : AlertItem?
    
    @Published var isLoading = false ;
    
     func getAppetizers() {
         self.isLoading = true ;
        NetworkManager.shared.getAppetizers {result in
            DispatchQueue.main.async{
                switch result {
                case .success(let appetizers):
                    self.isLoading = false
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }

    
}
