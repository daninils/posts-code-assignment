//
//  PostsView.swift
//  code-assignment
//
//  Created by Daniel Nilsson on 2023-03-07.
//

import SwiftUI

struct PostsView: View {
  @StateObject var viewModel = PostsViewModel()
  
  var body: some View {
    switch viewModel.state {
    case .loaded(let posts):
      ContentView(posts: posts)
    case .loading:
      LoadingView()
    case .failure:
      ErrorView()
    case .initial:
      Color.clear.onAppear {
        viewModel.load()
      }
    }
  }
  
  struct ContentView: View {
    let posts: [Post]
    
    var body: some View {
      ScrollView {
        LazyVStack(alignment: .leading) {
          ForEach(posts) { post in
            Text(post.title)
              .bold()
              .font(.title)
            Text(post.body)
              .font(.body)
            Divider()
          }
        }
        .padding()
      }
    }
  }
}

struct PostsView_Previews: PreviewProvider {
  static var previews: some View {
    PostsView()
  }
}
