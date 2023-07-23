//
//  Posts.swift
//  Insta
//
//  Created by antuni gr on 22/07/23.
//

import Foundation

struct Posts: Identifiable {
    var id: String
    var userImageUrl: ImagesProfileUrls
    var userName: String
    var location: String
    var timePostedSinceNow: String
    var postImageUrl: ImagesUrls
    var likeCount: Int
        
    init(id: String, userImageUrl:ImagesProfileUrls, userName: String, location: String, timePostedSinceNow: String, postImageUrl: ImagesUrls, likeCount: Int){
        self.id = id
        self.userImageUrl = userImageUrl
        self.userName = userName
        self.location = location
        self.timePostedSinceNow = timePostedSinceNow
        self.postImageUrl = postImageUrl
        self.likeCount = likeCount
    }
}

extension Posts: Decodable{
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case userImageUrl = "large"
        case userName = "username"
        case location = "location"
        case timePostedSinceNow = "updated_at"
        case postImageUrl = "regular"
        case likeCount = "likes"
}}

struct ImagesUrls: Decodable {
    
    var regular: String
    
    enum CodingKeys: String, CodingKey{
        case regular = "regular"
    }
}

struct ImagesProfileUrls: Codable {
    
    var large: String
    
    enum CodingKeys: String, CodingKey{
        case large = "large"
    }
}

struct User: Codable {
    let id: String
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio: String
    let location: String?
    let profileImage: ImagesProfileUrls
    let instagramUsername: String
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio
        case location
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
    }
}

