//
//  CurrentReciepeManager.swift
//  Foodpedia
//
//  Created by FoodPedia on 12/14/21.
//

import Foundation


class CurrentReciepeManager: ObservableObject {
    
    @Published var currentReceipe : ReceipeModel! = nil
    
    @Published var stepsForCurrentReciepe : [StepsModel] = [StepsModel(number: 1, step: "get out")]
    
    private init() {}
    
    public static var shared  = CurrentReciepeManager()
}
