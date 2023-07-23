//
//  GetPostRepository.swift
//  Insta
//
//  Created by antuni gr on 22/07/23.
//

import Foundation
import Combine

enum NetworkError: Error{
    case requestError
}

struct GetPostRepository{
    
    
    func execute() -> AnyPublisher<[Posts], Error> {
        let request = URLRequest(url: URL(string: "https://api.unsplash.com/photos/?client_id=Au6HUeL30WW4msBXreC64xx8fjwZDrDwdAmFkCSE374")!)
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw NetworkError.requestError
                    }
                return data
            }
            .decode(type: [Posts].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
