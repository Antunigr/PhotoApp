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
//    @Published var posts: [Posts]
//    @Published var errorMessage: String
//
//    var getPostsRepository: GetPostRepository = GetPostRepository()
//
//    var viewState: FeedViewState
//    var cancellable: AnyCancellable?
//
//    init(){
//        self.posts = []
//        self.errorMessage = ""
//        self.viewState = .loading
//    }
//
//    func loadPosts(){
//
//            cancellable = getPostsRepository
//            .loadData()
//            .sink(receiveCompletion:{ completion in
//                switch completion{
//                case .failure(_):
//                    self.viewState = .error
//                    break
//                case .finished: break
//            }},
//                receiveValue: {posts in
//                    DispatchQueue.main.async {
//                        self.viewState = .ready
//                        self.posts = posts
//            }
//        })
//    }
    @Published var photoArray: [Posts] = []

    init() {
        loadData()
    }
    
    func loadData() {
        let key = "Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374"
        let url = "https://api.unsplash.com/photos/random/?count=1&client_id=\(key)"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode([Posts].self, from: data)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
            } catch {
                print("viewModelERRodoantuni")
                print(error)
            }
        }.resume()
    }
}
