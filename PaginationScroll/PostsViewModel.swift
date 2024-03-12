//
//  PostsViewModel.swift
//  PaginationScroll
//
//  Created by edo lubis on 12/03/24.
//

import Foundation

class PostsViewModel: ObservableObject {
    
    let repository = PostRepository()
    @Published var posts: [PostModel]? = nil
    @Published var isLoadMore = true
    
    func getPosts() {
        Task {
            do {
                try    await  Task.sleep(nanoseconds: 3 * 1_000_000_000)
                let data = try await repository.getPost()
                DispatchQueue.main.async {
                    self.posts =  data
                }
            } catch {
            }
            
        }
    }
    
    func loadMore() {
        Task {
            do {
                try    await  Task.sleep(nanoseconds: 3 * 1_000_000_000)
                let data = try await repository.getPost()
                DispatchQueue.main.async {
                    if let posts = self.posts {
                        self.posts = posts + data
                    }
                    
                }
            } catch {
            }
            
        }
    }
}
