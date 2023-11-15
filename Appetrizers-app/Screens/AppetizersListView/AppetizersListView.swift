//
//  AppetizersListView.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 15/11/23.
//

import SwiftUI

struct AppetizersListView : View {
    @StateObject var viewModel = AppetizerListViewModel()
    var body : some View {
        ZStack{
            NavigationStack{ // used NavigationStack as NavigationView is depricated
                List(viewModel.appetizers) { appetizer in
                    AppetizerCellView(data: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }.onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                ProgressView()
                    .foregroundStyle(Color.white)
            }

            }.alert(item : $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title , message: alertItem.message , dismissButton: alertItem.dismissButton)
        }
    }

}

#Preview{
    AppetizersListView()
}
