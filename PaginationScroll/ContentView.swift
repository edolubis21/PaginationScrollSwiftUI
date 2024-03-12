//
//  ContentView.swift
//  PaginationScroll
//
//  Created by edo lubis on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var postsViewModel = PostsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if let data = postsViewModel.posts {
                    ForEach(data.indices, id: \.self) { index in
                        Text(data[index].title)
                            .onAppear {
                                if index == data.count - 1 {
                                    postsViewModel.loadMore()
                                }
                                
                            }
                    }
                    ProgressView()
                              .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("Loading...")
                }
            }
        }
        .onAppear {
            postsViewModel.getPosts()
        }
    }
}

#Preview {
    ContentView()
}
