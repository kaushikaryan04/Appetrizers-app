//
//  ContentView.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 15/11/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        // link to backend ->  https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers
            TabView{
                AppetizersListView()
                    .tabItem {
                        Image(systemName : "house")
                        Text("Home")
                    }
                AccountView()
                    .tabItem {
                        Image(systemName : "person")
                        Text("Account")
                    }
                OrderView()
                    .tabItem {
                        Image(systemName : "bag")
                        Text("Order")
                    }
            }.tint(Color.brandPrimary)

    }
}

#Preview {
    AppetizerTabView()
}
