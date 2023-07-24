//
//  ImageView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//
	
import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    
    var imgUrl: String
    
    init(url: String){
        self.imgUrl = url
    }
    
    var body: some View {
        
        AnimatedImage(url: URL(string:imgUrl))
            .resizable()
    }

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        return ImageView(url: "string")
    }
}
}
