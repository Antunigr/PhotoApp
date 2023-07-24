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
                    Text(post.user.username ?? "dea")
                        .font(.footnote).fontWeight(.bold)
                    HStack{
                        Text(post.location.city ?? "nao achou")
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
        let examplePost = Posts(id: "1", // Substitua "1" pelo ID desejado
                                user: User(id: "user_id", // Substitua "user_id" pelo ID do usuário
                                           username: "example_user",
                                           name: "Example User",
                                           firstName: "Example",
                                           lastName: "User",
                                           twitterUsername: "example_twitter",
                                           portfolioURL: "example_portfolio",
                                           bio: "Example bio",
                                           location: "Example City",
                                           profileImage: ImagesProfileUrls(large: "example_profile_image"),
                                           instagramUsername: "example_instagram",
                                           totalCollections: 10,
                                           totalLikes: 100,
                                           totalPhotos: 50,
                                           acceptedTos: true,
                                           forHire: false),
                                location: Location(name: "Example Location",
                                                   city: "Example City",
                                                   country: "Example Country"),
                                timePostedSinceNow: "1 hour ago",
                                imagesUrls: ImagesUrls(regular: "example_regular_image_url",
                                                      full: "example_full_image_url",
                                                      small: "example_small_image_url"),
                                likeCount: 50)
        CardView(post: examplePost)
    }
}
