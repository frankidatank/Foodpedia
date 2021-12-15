//
//  NavBar.swift
//  Foodpedia
//
//  Created by FoodPedia on 12/14/21.
//



import SwiftUI

struct NavBar: View {
    
    var color : Color
    var bodyText : String
    
    var body: some View {
        ZStack (alignment : .bottom){
            Color.clear
            
            Text(bodyText)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                
        }
        .frame(maxWidth : .infinity)
        .frame(height : 215)
        .background(color, alignment: .center)
        .cornerRadius(35)
//        .ignoresSafeArea(/*@START_MENU_TOKEN@*/.keyboard/*@END_MENU_TOKEN@*/, edges: .top)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(color: .blue, bodyText : "Choose Ingredients")
    }
}
