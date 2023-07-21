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
    var userImage: Image
    var userName: String
    var timePostedSinceNow: String
    var postImage: Image
    var commentCount: Int
    var likeCount: Int
}

let postData = [
    Post(userImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")) , userName: "Jhon", timePostedSinceNow: "2 minutes ago", postImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")), commentCount: 3, likeCount: 2),
    
    Post(userImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")) , userName: "July", timePostedSinceNow: "30 minutes ago", postImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")), commentCount: 15, likeCount: 7),
    
    Post(userImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")) , userName: "Anne", timePostedSinceNow: "5 hours ago", postImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")), commentCount: 200, likeCount: 65),
    
    Post(userImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")) , userName: "Stef", timePostedSinceNow: "45 minutes ago", postImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")), commentCount: 4124, likeCount: 800),
    
    Post(userImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")) , userName: "Milie", timePostedSinceNow: "now", postImage: Image(uiImage:#imageLiteral(resourceName: "cara2.jpg")), commentCount: 0, likeCount: 0),
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
