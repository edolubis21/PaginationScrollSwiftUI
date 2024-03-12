//
//  PostRepository.swift
//  PaginationScroll
//
//  Created by edo lubis on 12/03/24.
//

import Foundation

class PostRepository {
    
    func getPost() async throws -> [PostModel] {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let urlComponents = URLComponents(string: url)!
        let urlRequest = URLRequest(url: urlComponents.url!)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodable = try JSONDecoder().decode([PostModel].self, from: data)
        return decodable
    }
    
}
