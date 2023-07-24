import SwiftUI

struct CardView: View{
    var post: Posts
    
    var body: some View{
        VStack{
            HStack{
                ImageView(url: post.user.profileImage.large)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: 36, height: 36)
                
                VStack(alignment: .leading){
                    Text(post.user.username ?? "")
                        .font(.footnote).fontWeight(.bold)
                    HStack{
                        Text((post.location.city ?? "") + (post.location.city != nil && post.location.country != nil ? ", " : "") + (post.location.country ?? ""))

                            .font(.footnote).fontWeight(.light)
                        Spacer()
                        Text(post.timePostedSinceNow)
                            .font(.footnote).fontWeight(.light)
                    }
                }
            }
            
            ImageView(url: post.imagesUrls.full)
                .frame(height: 400)
                .shadow(color: Color("DefaultShadow"), radius: 15, x: 1, y: 2)
                .padding(.trailing, -16)
                .padding(.leading, -16)
            
            HStack(spacing:30){
                Button(action: {}){
                    HStack{
                        Image(systemName: "heart")
                            .font(Font.system(size: 25).weight(.semibold))
                        Text("\(post.likeCount)").font(.body)
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {}){
                    HStack{
                        Image(systemName: "bubble.right")
                            .font(Font.system(size: 25).weight(.semibold))
                        Text("\(post.likeCount * 2 - (post.likeCount / 2) - 3)").font(.body)
                    }
                    .foregroundColor(.black)
                }
            }
            .padding(.bottom)
            Spacer()
        }
        .padding(.trailing,16)
        .padding(.leading,16)
        
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let initPosts: InitPosts = InitPosts()
        CardView(post: initPosts.posts)
    }
}
