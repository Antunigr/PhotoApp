//
//  ImageView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//
	
import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    
    var feedview: FeedViewModel = FeedViewModel()
    
    var imageName: String = "cara"
    var url: URL
    
    init(url: URL){
        self.url = url
    }
    
    var body: some View {
        
    AnimatedImage(url: url)
            .resizable()
    }

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        return ImageView(url: <#T##URL#>)
        }
    }
}
