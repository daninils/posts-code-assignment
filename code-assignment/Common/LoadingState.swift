//
//  LoadingState.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import Foundation

enum LoadingState<T> {
  case initial
  case loading
  case loaded(T)
  case failure(Error)
  
  enum Error: Swift.Error {
    case failure
  }
}
