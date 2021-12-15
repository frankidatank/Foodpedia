//
//  IsSearching.swift
//  Foodpedia
//
//  Created by FoodPedia on 12/14/21.
//

import SwiftUI

class IsSearching: ObservableObject {
    
    @Published var isSearching : Bool = false
    
    private init() {}
    
    static var shared = IsSearching()
}
