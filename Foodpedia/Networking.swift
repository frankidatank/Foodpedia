//
//  Networking.swift
//  Foodpedia
//
//  Created by Frankie Murillo on 11/14/21.
//

import SwiftUI


class Networking {
    
    private var dataTask : URLSessionDataTask? = nil
    
    private init() {}
    
    public static var shared = Networking()
    
    func fetchReceipe(with ingredients : [String]){
        
        if dataTask != nil{
            print("wait task is going on")
            return
        }
        
        var url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=\(constants.APIKey)&ingredients="
        for item in ingredients {
            url = "\(url)\(item),+"
        }
        
        url = String(url.dropLast())
        url = String(url.dropLast())
        
        
        url = url.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        print(url)
        
        dataTask = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                print("error happed")
                self.dataTask = nil
                return
            }else{
                if data != nil {
                    DispatchQueue.main.async {
                        do {
                            ObservedReciepies.shared.reciepeList = try JSONDecoder().decode([ReceipeModel].self , from: data!)
                            print(ObservedReciepies.shared.reciepeList)
                        } catch  {
                            print("error while parsing data from json data with error \(error)")
                        }
                    }
                    
                }
                self.dataTask = nil
            }
            DispatchQueue.main.async {
                IsSearching.shared.isSearching = false
            }
        })
        dataTask?.resume()
    }
    
    
    func fetchSteps(reciep ID : Int) {
        
        CurrentReciepeManager.shared.stepsForCurrentReciepe = [StepsModel]()
        
        if dataTask != nil{
            print("wait task is going on")
            return
        }
        
        let url = "https://api.spoonacular.com/recipes/\(ID)/analyzedInstructions?apiKey=\(constants.APIKey)"
        
        dataTask = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                self.dataTask = nil
                return
            }else{
                if data != nil{
                    do {
                        let item = try JSONDecoder().decode([ReciepeStepsModel].self, from: data!)
                        
                        DispatchQueue.main.async {
                            CurrentReciepeManager.shared.stepsForCurrentReciepe = item.first?.steps ?? [StepsModel]()
                        }
                        print(CurrentReciepeManager.shared.stepsForCurrentReciepe)
                    } catch  {
                        print("error while parsing data from json data with error \(error)")
                    }
                }
                self.dataTask = nil
            }
        })
        dataTask?.resume()
    }
    
}

