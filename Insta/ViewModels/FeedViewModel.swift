//
//  FeedViewModel.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//

import Foundation
import Combine
import SwiftUI

enum FeedViewState{
    case loading, ready, error
}

class FeedViewModel: ObservableObject{
    @Published var posts: [Posts]
    @Published var errorMessage: String
    
    var getPostsRepository: GetPostRepository = GetPostRepository()
    
    var viewState: FeedViewState
    var cancellable: AnyCancellable?
    
    init(){
        self.posts = []
        self.errorMessage = ""
        self.viewState = .loading
    }
    
    func loadPosts(){
        
            cancellable = getPostsRepository
            .execute()
            .sink(receiveCompletion:{ completion in
                switch completion{
                case .failure(_):
                    self.viewState = .error
                    break
                case .finished: break
            }},
                receiveValue: {posts in
                    DispatchQueue.main.async {
                        self.viewState = .ready
                        self.posts = posts
            }
        })
    }
}
