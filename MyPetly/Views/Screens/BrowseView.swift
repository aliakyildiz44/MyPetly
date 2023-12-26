//
//  BrowseView.swift
//  MyPetly
//
//  Created by Ali on 16.12.2023.
//

import SwiftUI

struct BrowseView: View {
    var posts = PostArrayObject()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            CarouselView()
            ImageGridView(posts: posts)
        })
        .navigationBarTitle("Keşfet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BrowseView()
        }
    }
}
