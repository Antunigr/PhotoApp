//
//  CardView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//

import SwiftUI

struct CardView: View{
    var post: Posts
    
    var body: some View{
        VStack{
            HStack{
                ImageView(url: post.imagesUrls.regular)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: 36, height: 36)
                
                VStack(alignment: .leading){
                    Text(post.user.username)
                        .font(.footnote).fontWeight(.bold)
                    HStack{
                        Text(post.location.city)
                            .font(.footnote).fontWeight(.light)
                        Spacer()
                        Text(post.timePostedSinceNow)
                            .font(.footnote).fontWeight(.light)
                    }
                }
            }
            
            ImageView(url: post.imagesUrls.full)
                .frame(height: 380)
                .shadow(color: Color("DefaultShadow"), radius: 3, x: 1, y: 2)
            
            HStack(spacing:30){
                Button(action: {}){
                    HStack{
                        Image(systemName: "heart")
                            .font(Font.headline.weight(.semibold))
                        Text("\(post.likeCount)").font(.caption)
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {}){
                    HStack{
                        Image(systemName: "bubble.right")
                            .font(Font.headline.weight(.semibold))
                        Text("\(post.likeCount)").font(.caption)
                    }
                    .foregroundColor(.black)
                }
            }
            .padding(.top)
            Spacer()
        }
        .padding(.trailing)
        .padding(.leading)
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
