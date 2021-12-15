//
//  UrlImageView.swift
//  Foodpedia
//
//  Created by Frankie Murillo on 11/14/21.
//


import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        ZStack{
            
            
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .foregroundColor(.blue)
//            .frame(width: 100, height: 100)
            
            if urlImageModel.image == nil {
                Color.black
            }
            
            if urlImageModel.image == nil {
                ProgressView()
                    .foregroundColor(.blue)
            }
        }
    }
    
    static var defaultImage = UIImage(systemName : "doc")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
