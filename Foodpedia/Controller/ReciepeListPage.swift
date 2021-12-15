//
//  ReciepeListPage.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//

import SwiftUI

struct ReciepeListPage: View {
    
    @ObservedObject var data = ObservedReciepies.shared
    
    var body: some View {
        ZStack{
            
            if data.reciepeList.isEmpty{
                Text("Search with ingredient")
                    .font(.title3)
                    .foregroundColor(Color(UIColor.label))
            }else{
                ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .center, spacing: nil, content: {
                    ForEach(data.reciepeList , id : \.self) { item in
                        
                        ReceipeListCell(item: item)
                        
//                    ForEach(Array(0...10) , id : \.self) { item in
                        
                        
                    }
                })
            }
            }
        }
    }
}

struct ReciepeListPage_Previews: PreviewProvider {
    static var previews: some View {
        ReciepeListPage()
    }
}
