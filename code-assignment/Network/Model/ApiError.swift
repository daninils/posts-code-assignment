//
//  ApiError.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import Foundation

enum ApiError: Error {
  case missingStatusCode
  case serverError
  case invalidResponse
  case decodable(error: Error)
  
  init(statusCode: Int) {
    switch statusCode {
    case 500:
      self = .serverError
    default:
      self = .invalidResponse
    }
  }
}
