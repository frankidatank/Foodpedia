//
//  SearchReciepe.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//

import SwiftUI

struct SearchReciepe: View {
    
    @EnvironmentObject var navigator : Navigator
    @ObservedObject var list = IngredientList.shared
    @ObservedObject var isSearching = IsSearching.shared
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()) , GridItem(.flexible())], alignment: .center,  content: {
                    
                    ForEach(list.ingredientList , id : \.self) { item in
                        SearchCell(item: item)
                            .onTapGesture {
                                list.ingredientList[item.id].isSelected.toggle()
                                print(list.ingredientList[item.id].isSelected)
                            }
                    }
                })
            }
            Button(action: {
                
                var indredients = [String]()
                
                for item in IngredientList.shared.ingredientList {
                    if item.isSelected {
                        indredients.append(item.name)
                    }
                }
                isSearching.isSearching = true
                Networking.shared.fetchReceipe(with: indredients)
                
                
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    
                navigator.isSearchPageOpen = false
                navigator.isReciepOpen = false
                navigator.isReciepeListOpen = true
                    
                }
                
            }, label: {
                Text("Search")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(maxWidth : .infinity)
                    .padding()
            })
            .background(Color.blue, alignment: .center)
            .cornerRadius(10)
            .padding(.horizontal)
            
        }
    }
}

struct SearchReciepe_Previews: PreviewProvider {
    static var previews: some View {
        SearchReciepe()
    }
}
