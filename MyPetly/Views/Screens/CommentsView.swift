//
//  CommentsView.swift
//  MyPetly
//
//  Created by Ali on 8.12.2023.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) {comment in
                        MessageView(comment: comment  )
                    }
                }
            }
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Buraya bir yorum ekle", text: $submissionText)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
            }
            .padding(.all, 6)
        }
        .padding(.horizontal)
        .navigationTitle("Yorum")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComment()
        })
    }
    // Fonksiyonlar
    func getComment() {
        print("Yorum veritabanından geldi.")
        let comment1 = CommentModel(commentID: "", userID: "", username: "Ali", content: "bu ilk yorum", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Fatih", content: "bu ikinci yorum", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Burak", content: "bu üçüncü yorum", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Mehmet", content: "bu dördüncü yorum", dateCreated: Date())

        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)

        
        
    }
    
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
