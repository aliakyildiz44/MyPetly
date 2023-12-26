//
//  PostView.swift
//  MyPetly
//
//  Created by Ali on 8.12.2023.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named: "dog3")!
    
    @State var animateLike: Bool = false
    @State var addheartAnimationToView: Bool
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            // Üst Kısım
            if showHeaderAndFooter {
                HStack {
                    
                    NavigationLink(destination: ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID),
                                   label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                        .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    
                    //MARK: GÖNDERİ AYARLAR BUTONU
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet, content: {
                        getActionSheet()
                    })
                    
                    
                }
                .padding(.all,6)
            }
           
            
            // Resim
            
            ZStack{
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                
                if addheartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
        
                
            // FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20, content: {
                    
                    Button(action: {
                        if post.likedByUser {
                            //unlike
                            unlikePosts()
                        } else {
                            //like
                            likePosts()
                        }
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .red : .primary)
                   
                    
                    //  Yorum Simgeleri
                    NavigationLink(destination: CommentsView(), label: {
                        Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.primary)
                    })
                    
                    Button(action: {
                        sharePost()
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)
                    
                   
                    
                    Spacer()
                })
                .padding(.all,6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.all, 6)
                }
            }
            
           
        })
    }
    
    //MARK: Fonksiyonlar
    
    func likePosts() {
        
        // veritabanından gelecek
        let updatedPosts = PostModel(postID: post.postID, userID: post.userID, username: post.username, dateCreate: post.dateCreate, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPosts
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateLike = false
        }
    }
    
    func unlikePosts() {
        let updatedPosts = PostModel(postID: post.postID, userID: post.userID, username: post.username, dateCreate: post.dateCreate, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPosts
        
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("Ne yapmak istersiniz?"),
                message: nil, buttons: [
                    .destructive(Text("Bildir!"), action: {
                        
                        self.actionSheetType = .reporting
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.showActionSheet.toggle()
                        }
                        
                    }),
                    .default(Text("Daha fazla bilgi..."), action: {
                        print("Daha fazla bilgi edinin")
                    }),
                    
                    .cancel()
            ])
        case .reporting:
            return ActionSheet(title: Text("Neden bu gönderiyi bildirmek istiyorsunuz?"), message: nil, buttons: [
                
                .destructive(Text("Uygunsuz Gönderi"), action: {
                    reportPost(reason: "Uygunsuz Gönderi")
                }),
                .destructive(Text("Bu bir spam"), action: {
                    reportPost(reason: "Bu bir spam")
                }),
                .destructive(Text("Beni Rahatsız Etti"), action: {
                    reportPost(reason: "Beni Rahatsız Etti")
                }),
                
                .cancel({
                    self.actionSheetType = .general
                })
            ])
        
        }
        
    }
    
    func reportPost(reason: String) {
        print("Gönderiyi şimdi bildir!")
    }
    
    func sharePost() {
        
        let message = "MyPetly'deki bu gönderiye göz atın"
        let image = postImage
        let link = URL(string: "https://google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let viewController = windowScene.windows.first?.rootViewController {
            // Kullanılacak viewController burada
            viewController.present(activityViewController, animated: true, completion: nil)
        }
        
       
    }
    
}



struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Ali", caption: "test açıklama", dateCreate: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addheartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
