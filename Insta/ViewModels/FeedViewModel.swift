//
//  FeedViewModel.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//

import Foundation
import Combine
import SwiftUI

struct Post{
    var id: UUID = UUID()
    var userImage: String
    var userName: String
    var location: String
    var timePostedSinceNow: String
    var postImage: String
    var commentCount: Int
    var likeCount: Int
}

let postData = [
    Post(userImage: "moca.jpg" , userName: "Jhon", location: "London", timePostedSinceNow: "2 minutes ago", postImage: "cara.jpg", commentCount: 3, likeCount: 2),
    
    Post(userImage: "moca2.jpg" , userName: "July",location: "London", timePostedSinceNow: "30 minutes ago", postImage: "montanha.jpg", commentCount: 15, likeCount: 7),
    
    Post(userImage: "cara2.jpg" , userName: "Anne", location: "London",timePostedSinceNow: "5 hours ago", postImage: "cara2.jpg", commentCount: 200, likeCount: 65),
    
    Post(userImage: "moca.jpg" , userName: "Stef", location: "London",timePostedSinceNow: "45 minutes ago", postImage: "rose.jpg", commentCount: 4124, likeCount: 800),
    
    Post(userImage: "moca2.jpg" , userName: "Milie", location: "London",timePostedSinceNow: "now", postImage: "cyberpunk.jpg.jpg", commentCount: 0, likeCount: 0),
]

class FeedViewModel: ObservableObject{
    @Published var posts: [Post]
    
    var cancellable: AnyCancellable?
    
    init(){
        self.posts = []
            
    }
    
    func loadPosts(){
        let subject = PassthroughSubject<[Post], Never>()
            cancellable = subject.sink(receiveValue: { posts in
                    self.posts = posts
                })
        
        subject.send(postData)
    }
}
