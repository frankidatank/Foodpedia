//
//  ReciepeStepsModel.swift
//  Foodpedia
//
//  Created by Frankie Murillo on 11/14/21.
//

import Foundation

struct ReciepeStepsModel : Codable{
    var steps : [StepsModel]
}

struct StepsModel : Hashable , Codable{
    let number : Int
    let step : String
    var id : Int{
        return number
    }
}
