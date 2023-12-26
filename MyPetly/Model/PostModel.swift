//
//  PostModel.swift
//  MyPetly
//
//  Created by Ali on 8.12.2023.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    
    var id = UUID()
    var postID: String
    var userID: String
    var username: String
    var caption: String?
    var dateCreate: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // postID
    // userID
    // user username
    // caption - optional
    // date
    // like count
    // liked by current user
}
