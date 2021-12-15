//
//  SearchCell.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//

import SwiftUI

struct SearchCell: View {
    
    var item : IngredientModel
    
    var body: some View {
        
        ZStack{
            
//            Color.white
            HStack{
                
                Image(systemName: item.isSelected ? "checkmark.square.fill" : "square")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading , 5)
                    .foregroundColor(.gray)
                    
//                Spacer()
                
                Text(item.name)
                    .font(.headline)
                    .bold()
                    .padding(.leading , 5)
                
                Spacer()
            }
            .padding(.vertical , 7)
            .frame(maxWidth : .infinity)
            .frame(height: 65, alignment: .center)
            .border(Color.blue, width: 1)
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell(item: IngredientModel.init(id: 0, name: "hamburger", code: "202"))
    }
}
