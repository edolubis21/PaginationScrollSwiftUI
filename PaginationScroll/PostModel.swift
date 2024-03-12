//
//  Post.swift
//  PaginationScroll
//
//  Created by edo lubis on 12/03/24.
//

import Foundation

struct PostModel: Identifiable, Equatable, Codable {
    let id: Int
    let title: String
    let body: String
}
