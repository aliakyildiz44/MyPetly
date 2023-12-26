//
//  PostArrayObject.swift
//  MyPetly
//
//  Created by Ali on 8.12.2023.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        
        print("Fetch from database here")
        
        let post1 = PostModel(postID: "", userID: "", username: "Ali",caption: "Bu bir deneme yazısıdır.", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Fatih",caption: nil, dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Burak",caption: "Bu bir deneme yazısıdır.", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Mehmet",caption: "Bu bir deneme yazısıdır.", dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    /// Tek Gönderinin Seçimi İçin 
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
