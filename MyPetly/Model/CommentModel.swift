//
//  CommentModel.swift
//  MyPetly
//
//  Created by Ali on 10.12.2023.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String
    var userID: String
    var username: String
    var content: String
    var dateCreated: Date
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
