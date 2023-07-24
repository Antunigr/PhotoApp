import Foundation
import Combine

class PostsRepository {

    func loadData(completion: @escaping ([Posts]?) -> Void) {
        let key = "Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374"
        let url = "https://api.unsplash.com/photos/random/?count=10&client_id=\(key)"
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            do {
                let json = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print("Failed to decode data: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
