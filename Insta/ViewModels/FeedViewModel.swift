import Foundation
import Combine

class FeedViewModel: ObservableObject {

    @Published var posts: [Posts] = []

    private var cancellables = Set<AnyCancellable>()
    private let repository = PostsRepository()

    init() {
        loadData()
    }

    func loadData() {
        repository.loadData { [weak self] post in
            if let photoArray = post {
                self?.posts = photoArray
            }
        }
    }
}
