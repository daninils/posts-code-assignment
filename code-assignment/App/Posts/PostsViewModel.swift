//
//  PostsViewModel.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
  @Published var state: LoadingState<[Post]> = .initial
  
  private var cancellable: AnyCancellable?
  
  func load() {
    state = .loading
    cancellable = PostsProvider()
      .fetch()
      .receive(on: RunLoop.main)
      .sink(
        receiveCompletion: { [weak self] completion in
          if case .failure = completion {
            self?.state = .failure(.failure)
          }
        },
        receiveValue: { [weak self] response in
          self?.didReceive(response)
        }
      )
  }
  
  private func didReceive(_ response: [Post]) {
    let filteredResponse = Array(response.prefix(50))
    state = .loaded(filteredResponse)
  }
}
