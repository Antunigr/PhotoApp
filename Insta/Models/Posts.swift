//
//  Posts.swift
//  Insta
//
//  Created by antuni gr on 22/07/23.
//

import Foundation

struct Posts: Identifiable {
    var id: String
    var userImageUrl: String
    var userName: String
    var location: String?
    var timePostedSinceNow: String
    var postImageUrl: String
    var likeCount: Int
            
    init(id: String, userImageUrl:String, userName: String, location: String, timePostedSinceNow: String, postImageUrl: String, likeCount: Int){
        self.id = id
        self.userImageUrl = userImageUrl
        self.userName = userName
        self.location = location
        self.timePostedSinceNow = timePostedSinceNow
        self.postImageUrl = postImageUrl
        self.likeCount = likeCount
    }
}

extension Posts: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case userImageUrl = "regular"
        case userName = "username"
        case location = "location"
        case timePostedSinceNow = "updated_at"
        case postImageUrl = "large"
        case likeCount = "likes"
    }
}
