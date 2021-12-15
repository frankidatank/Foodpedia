//
//  IngredientModel.swift
//  Foodpedia
//
//  Created by FoodPedia on 12/14/21.
//

import Foundation
import Combine

struct IngredientModel : Hashable {
    
    var id : Int
    var name : String
    var code : String
    var isSelected : Bool = false
}
