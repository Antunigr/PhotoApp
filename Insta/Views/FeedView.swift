import SwiftUI

struct FeedView: View {
    @ObservedObject var feedViewModel: FeedViewModel
    
    init(initFeedViewModel: FeedViewModel){
        self.feedViewModel = initFeedViewModel
    }
    
    var body: some View {
        ZStack{
            VStack{
                NavigationView()
                VStack{
                    if !self.feedViewModel.posts.isEmpty{
                        ScrollView{
                            ForEach(self.feedViewModel.posts) {post in
                                CardView(post: post)
                            }
                        }
                    }}
                }
                .padding(.bottom)
                Spacer()
        }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                self.feedViewModel.loadData()
            }
    }
}
    
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(initFeedViewModel: FeedViewModel())
    }
}

