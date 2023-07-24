//
//  GetPostRepository.swift
//  Insta
//
//  Created by antuni gr on 22/07/23.
//

import Foundation
import Combine
import Alamofire

//enum NetworkError: Error{
//    case requestError
//}

//struct GetPostRepository{
//
////    func execute() -> AnyPublisher<[Posts], Error> {
////        let request = URLRequest(url: URL(string: "https://api.unsplash.com/photos/?client_id=Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374")!)
////        return URLSession
////            .shared
////            .dataTaskPublisher(for: request)
////            .tryMap { data, response -> Data in
////                guard let httpResponse = response as? HTTPURLResponse,
////                    httpResponse.statusCode == 200 else {
////                        throw NetworkError.requestError
////                    }
////                return data
////            }
////            .decode(type: [Posts].self, decoder: JSONDecoder())
////            .eraseToAnyPublisher()
////    }
//
//
//    func execute() -> AnyPublisher<[Posts], Error> {
//
//        let url = URL(string:"https://api.unsplash.com/photos/?client_id=Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374") else {return}
//        AF.request(url).responseData { (reponseData) in
//            if let data = responseData.data, let imageDetails = try?
//                JSONDecoder().decode([Posts].self, from: data){
//                self.posts = Posts
//            }
//        }
//    }
//
//}

class GetPostRepository: ObservableObject {
    @Published var photoArray: [Posts] = []

    init() {
        loadData()
    }
    
    func loadData() {
        let key = "Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
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
                print(error.localizedDescription)
            }
        }.resume()
    }
}
