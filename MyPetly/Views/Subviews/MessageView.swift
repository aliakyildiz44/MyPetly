//
//  MessageView.swift
//  MyPetly
//
//  Created by Ali on 9.12.2023.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            
            //Profil Resmi
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment:.leading, spacing: 4, content: {
                               
                // Kullanıcı Adı
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // Yorum Bölümü
                Text (comment.content)
                    .padding(.all,10)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
                
            })
            
            Spacer(minLength: 0)
            
        }
    }
}


struct MessageView_Previews: PreviewProvider {
    
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Ali", content: "bu resim gerçekten çok güzel :)", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}

