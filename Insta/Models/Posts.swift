import Foundation

struct Posts: Identifiable {
    var id: String
    var user: User
    var location: Location
    var timePostedSinceNow: String
    var imagesUrls: ImagesUrls
    var likeCount: Int
        
    init(id: String, user: User, location: Location, timePostedSinceNow: String, imagesUrls: ImagesUrls, likeCount: Int){
        self.id = id
        self.user = user
        self.location = location
        self.timePostedSinceNow = timePostedSinceNow
        self.imagesUrls = imagesUrls
        self.likeCount = likeCount
    }
}

extension Posts: Decodable{
    enum CodingKeys: String, CodingKey{
        case id
        case user
        case location
        case timePostedSinceNow = "updated_at"
        case imagesUrls = "urls"
        case likeCount = "likes"
}}

struct Location: Decodable {
    var name: String?
    var city: String?
    var country: String?

    enum CodingKeys: String, CodingKey{
        case name
        case city
        case country
    }
}

struct ImagesUrls: Decodable {
    
    var regular: String
    var full : String
    var small : String
    
    enum CodingKeys: String, CodingKey{
        case regular
        case full
        case small
    }
}

struct User: Codable {
    let id: String
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let profileImage: ImagesProfileUrls
    let instagramUsername: String?
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

    
struct ImagesProfileUrls: Codable {
    
    var large: String
    
    enum CodingKeys: String, CodingKey{
        case large
    }
}
