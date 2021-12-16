//
//  CurrentReciepePage.swift
//  Foodpedia
//
//  Created by FoodPedia on 14/11/21.
//

import SwiftUI

struct CurrentReciepePage: View {
    
    @EnvironmentObject var navigator : Navigator
    @ObservedObject  var currentReciepeManager = CurrentReciepeManager.shared
    
    var model = ReceipeModel(id: 0, title: "title", image: "img", likes: 99, usedIngredients: [ReciepeIngredient](), missedIngredients: [ReciepeIngredient]())
    
    var body: some View {
        if currentReciepeManager.currentReceipe != nil{
        VStack(alignment : .center){
//            Image("img")
//                .resizable()
//                .scaledToFit()
            
            ZStack (alignment : .top){
                UrlImageView(urlString: currentReciepeManager.currentReceipe.image)
                    .ignoresSafeArea(.all, edges: .top)
                
                HStack{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            
                        navigator.isSearchPageOpen = false
                        navigator.isReciepOpen = false
                        navigator.isReciepeListOpen = true
                            
                        }
                    }, label: {
                        Text("< Back")
                            .bold()
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                .padding(.top)
            }
            
            ScrollView{
                VStack{
                HStack {
                    
                    Text("Used Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                        ForEach(currentReciepeManager.currentReceipe.usedIngredients , id : \.self) { item in
                            
                            HStack {
                                HStack(spacing : 7) {
                                    
                                    UrlImageView(urlString: "\(item.image)")
                                    
                                    
                                    Text(" -> \(getRoundedText(number: item.amount)) \(item.unit) \(item.name)")
                                        .padding()
                                }
                                .frame(height : 35)
                                
                                Spacer()
                            }
                    }
            }
            .padding()
                
                VStack{
                HStack {
                    
                    Text("Missed Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                    ForEach(currentReciepeManager.currentReceipe.missedIngredients , id : \.self) { item in
                        HStack {
                            HStack(spacing : 7) {
                                
                                UrlImageView(urlString: "\(item.image)")
                                
                                Text(" -> \(getRoundedText(number: item.amount)) \(item.unit) \(item.name)")
                                    .padding()
                            }
                            .frame(height : 35)
                            
                            Spacer()
                        }

                }
            }
            .padding()
                
                VStack {
                    
                    Text("Steps")
                        .font(.title)
                        .bold()
                        
                    VStack{
                        ForEach(currentReciepeManager.stepsForCurrentReciepe , id : \.self) { item in
                            VStack(spacing : 10){
                                HStack {
                                    Text("Step \(item.number)")
                                        .font(.title2)
                                        .padding(.leading)
                                        .padding(.leading)
                                    Spacer()
                                }
                                HStack {
                                    Text(item.step)
                                        .font(.title3)
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
                
            } // scroll view end point
            
        }
        }else{
            ZStack {
                Color.clear
                Text("No recipe to show")
                    .bold()
                    .foregroundColor(.blue)
                    .font(.largeTitle)
            }
        }
    }
    
    func getRoundedText(number : Double)->String {
        return "\(((number * 100).rounded())/100)"
    }
}

struct CurrentReciepePage_Previews: PreviewProvider {
    static var previews: some View {
        CurrentReciepePage().environmentObject(Navigator())
    }
}
