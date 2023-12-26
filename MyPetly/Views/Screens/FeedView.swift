//
//  FeedView.swift
//  MyPetly
//
//  Created by Ali on 8.12.2023.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var posts: PostArrayObject
    var title: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
           // Post Görünüm()
            LazyVStack {
                ForEach(posts.dataArray, id: \.self) { posts in
                    PostView(post: posts, showHeaderAndFooter: true, addheartAnimationToView: true)
                }
            }
        })
        .navigationBarTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(posts: PostArrayObject(), title: "Akış Test")
        }
    }
}
