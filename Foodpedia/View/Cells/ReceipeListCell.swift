//
//  ReceipeListCell.swift
//  Foodpedia
//
//  Created by FoodPedia on 12/14/21.
//

import SwiftUI

struct ReceipeListCell: View {
    
    @EnvironmentObject var navigator : Navigator
    var item : ReceipeModel
    
    var body: some View {
        VStack {
            ZStack(alignment : .bottom){

                UrlImageView(urlString: item.image)
                
                HStack {
                    Text(item.title)
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .background(Color.yellow)
                    Spacer()
                    
                    Text("\(item.likes) 👍")
                        .font(.title3)
                        .bold()
                }
                .foregroundColor(.white)
                .padding()
            }
            
            .cornerRadius(10)
            .padding()
            
            ZStack{
                Color.yellow
            }
            .frame(height : 1)
            .frame(maxWidth : .infinity)
        }
        .onTapGesture {
            CurrentReciepeManager.shared.currentReceipe = item
            Networking.shared.fetchSteps(reciep: item.id)
            navigator.isSearchPageOpen = false
            navigator.isReciepOpen = true
            navigator.isReciepeListOpen = false
        }
    }
}

struct ReceipeListCell_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeListCell(item: ReceipeModel.init(id: 0, title: "hello hamburger", image: "img", likes: 10, usedIngredients: [ReciepeIngredient](), missedIngredients: [ReciepeIngredient]()))
    }
}
