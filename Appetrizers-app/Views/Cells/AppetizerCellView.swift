//
//  AppetizerCellView.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 17/11/23.
//

import SwiftUI

struct AppetizerCellView: View {
    let data : Appetizer
    var body: some View {
        HStack{
            
            AppetizerRemoteImage(urlString: data.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth:120, maxHeight: 90)
                .cornerRadius(15)
            VStack(alignment:.leading , spacing : 5){
                Text(data.name)
                    .font(.title3)
                
                Text("$ \(data.price , specifier : "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
            
            Spacer()
        }
//        .padding()
        
    }
}

#Preview {
    AppetizerCellView(data: MockData.sampleAppetizer)
}
