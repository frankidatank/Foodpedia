//
//  ObservedReciepies.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//
import Combine
import Foundation


class ObservedReciepies: ObservableObject {
    
    @Published var reciepeList = [ReceipeModel]()
    
    private init() {}
    
    public static var shared  = ObservedReciepies()
}

