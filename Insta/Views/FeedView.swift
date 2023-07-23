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
                NavigationView()
                VStack{
                        ScrollView{
                            ForEach(self.fedViewModel.posts) {post in
                                CardView(post: post)
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
    
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(feedViewModel: FeedViewModel())
    }
}

