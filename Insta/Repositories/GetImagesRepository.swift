//
//  GetImagesRepository.swift
//  Insta
//
//  Created by antuni gr on 23/07/23.
//

import Foundation
import Combine

struct GetImagesRepository{
    
    func loadImage(url: String) -> AnyPublisher<Data, Error>{
        return URLSession
            .shared
            .dataTaskPublisher(for: URL(string: url)!)
            .tryMap{ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else{
                          throw NetworkError.requestError
                      }
                      return data
            }
            .eraseToAnyPublisher()
    }
    
}
