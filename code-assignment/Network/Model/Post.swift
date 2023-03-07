//
//  Post.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import Foundation

struct Post: Decodable, Identifiable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
