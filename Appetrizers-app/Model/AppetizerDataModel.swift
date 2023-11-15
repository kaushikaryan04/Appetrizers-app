//
//  AppetizerDataModel.swift
//  Appetrizers-app
//
//  Created by Aryan Kaushik on 17/11/23.
//

import Foundation


struct Appetizer : Decodable , Identifiable { // Codeable -> for both encoding and decoding Decodable -> only for decoding (We use this as we are only recieving data not changing and sending back
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL  : String
    let calories : Int
    let protein : Int
    let carbs : Int
}

struct AppetizerResponse : Decodable {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Mozzerlla Sticks", description: "Nice mozzerlla sticks", price: 50, imageURL: "", calories: 100, protein: 23, carbs: 50)
    
    static let appetizers = [sampleAppetizer , sampleAppetizer , sampleAppetizer , sampleAppetizer]
}
