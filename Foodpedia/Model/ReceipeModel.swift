//
//  ReceipeModel.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//

import Foundation


struct ReceipeModel : Codable , Hashable{
    
    let id : Int
    let title : String
    let image : String
    let likes : Int
    let usedIngredients : [ReciepeIngredient]
    let missedIngredients : [ReciepeIngredient]
    
}


struct ReciepeIngredient : Codable , Hashable {
    let id : Int
    let amount : Double
    let unit : String
    let name : String
    let image : String
    let aisle : String
}

