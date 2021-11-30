//
//  ContentView.swift
//  iosApp
//
//  Created by Frankie Murillo on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            welcomeTitile()
            Spacer()
            enterBar()
            Spacer()
        }
    }
    
}

struct enterBar: View {
    @State var textFieldInput : String = ""
    @State var dataArr : [String] = []
    var body: some View {
        Text("Enter your ingredients")
        
        VStack {
            HStack {
            TextField("Type something here...", text: $textFieldInput)
            .padding()
            .background(Color.white.cornerRadius(15))
            .font(.headline)
            
            Button(action: {
                saveInput()
            }, label: {
                Text("+")
                .padding()
                .background(.green)
                .cornerRadius(10)
            })
            
            }
            
            Text("in your fridge, you have...")
                .font(.footnote)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
        ForEach(dataArr, id: \.self){ data in
            Text(data)
            }
            
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Find Recipes ➡️")
                .padding()
                .background(.green)
                .cornerRadius(10)
            })
    
        }
    }
    
    func saveInput() {
        dataArr.append(textFieldInput)
        textFieldInput = ""
    }
        
}

struct welcomeTitile: View {
    var body: some View {
        Text("Welcome to Recipe+")
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(.trailing, 0.0)
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
  
//url with api key
