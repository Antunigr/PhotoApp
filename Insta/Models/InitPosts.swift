import Foundation


struct InitPosts{
    var posts: Posts = Posts(
           id: "1",
           user: User(id: "user_id",
           username: "example_user",
           name: "Example User",
           firstName: "Example",
           lastName: "User",
           twitterUsername: "example_twitter",
           portfolioURL: "example_portfolio",
           bio: "Example bio",
           location: "Example City",
           profileImage: ImagesProfileUrls(large: "example_profile_image"),
           instagramUsername: "example_instagram",
           totalCollections: 10,
           totalLikes: 100,
           totalPhotos: 50,
           acceptedTos: true,
           forHire: false),
           location: Location(name: "Example Location",
           city: "Example City",
           country: "Example Country"),
           timePostedSinceNow: "1 hour ago",
           imagesUrls: ImagesUrls(regular: "example_regular_image_url",
           full: "example_full_image_url",
           small: "example_small_image_url"),
           likeCount: 50)
}
