//
//  FoodDetailView.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 20/11/23.
//

import SwiftUI

struct FoodDetailView: View {
    
    let data : Appetizer ;
    
    var body: some View {
            
        VStack{
            AppetizerRemoteImage(urlString: data.imageURL)
                .frame(width: .infinity, height : 200)
                .aspectRatio(contentMode: .fit)
            
            Text(data.name)
                .font(.largeTitle)
                .fontWeight(.regular)
            
            Text(data.description)
                .font(.title2)
                .padding()
                .foregroundColor(.gray)
            
            HStack(spacing:50){
                VStack{
                    Text("Calories")
                    Text(data.calories.formatted())
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("Carbs")
                    Text(data.carbs.formatted() + " g")
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("Protein")
                    Text(data.protein.formatted() + " g")
                        .foregroundColor(.gray)
                }
            }.padding()
            
            Button(action:{
                
            }){
                Text("$ \(Int(data.price)) - Add to Order")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
                    
            }
            
            
            
            
                
        }
        
    }
}

#Preview {
    FoodDetailView(data:MockData.sampleAppetizer)
}
