//
//  ContentView.swift
//  Insta
//
//  Created by antuni gr on 20/07/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var fedViewModel: FeedViewModel
    
    init(feedViewModel: FeedViewModel){
        self.fedViewModel = feedViewModel
    }
    
    
    
    var body: some View {
        ZStack{
            VStack{
                NavigationBarView()
                VStack{
                    if !self.fedViewModel.posts.isEmpty{
                        ScrollView{
                            ForEach(self.fedViewModel.posts.indices, id: \.self) {index in
                                CardView(post: self.fedViewModel.posts[index])
                            }
                        }
                    }
                    
                    
                }
                .padding(.bottom)
                Spacer()
                
        }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                self.fedViewModel.loadPosts()
            }
    }
}
    
    

    struct CardView: View{
        var post: Post
        
        var body: some View{
            VStack{
                HStack{
                    ImageView(imageName: post.userImage)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: 36, height: 36)
                    
                    VStack(alignment: .leading){
                        Text(post.userName)
                            .font(.footnote).fontWeight(.bold)
                        HStack{
                            Text(post.location)
                                .font(.footnote).fontWeight(.light)
                            Spacer()
                            Text(post.timePostedSinceNow)
                                .font(.footnote).fontWeight(.light)
                        }
                    }
                }
                
                ImageView(imageName:post.postImage)
                    .frame(width: 380 ,height: 380)
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
                            Text("\(post.commentCount)").font(.caption)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }



    struct NavigationBarView: View {
        var body: some View{
            VStack{
                HStack{
                    Button(action: {}){
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 40, height: 35)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    Text("Instagram")
                        .font(Font.custom("fonte",size: 28))
                    Spacer()
                    
                    Button(action: {}){
                        ImageView(imageName:"cara")
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 1)
                    }
                    .foregroundColor(.black)
                  
                }
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
                
            }
        }
    }
}
 


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(feedViewModel: FeedViewModel())
    }
}
