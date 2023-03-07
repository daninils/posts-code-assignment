//
//  PostsProvider.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import Foundation
import Combine

class PostsProvider {
  func fetch() -> AnyPublisher<[Post], ApiError> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap({ element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse else {
          throw ApiError.missingStatusCode
        }
        
        guard httpResponse.statusCode == 200 else {
          throw ApiError(statusCode: httpResponse.statusCode)
        }
        
        return element.data
      })
      .decode(type: [Post].self, decoder: JSONDecoder())
      .mapError({ error -> ApiError in
        if let apiError = error as? ApiError {
          return apiError
        } else {
          // Change to have the correct error type of decodable instead of just `Error`
          return .decodable(error: error)
        }
      })
      .eraseToAnyPublisher()
  }
}
