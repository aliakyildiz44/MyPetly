//
//  ContentView.swift
//  MyPetly
//
//  Created by Ali on 7.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    
    var currentUserID: String? = nil
    
    var body: some View {
        
        TabView {
            NavigationView {
                FeedView(posts: PostArrayObject(), title: "Akış")
            }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Akış")
                }
            NavigationView {
                BrowseView()
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Arama")
                }
            UploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Paylaş")
                }
            ZStack{
                if currentUserID != nil {
                    NavigationView {
                        
                        ProfileView(isMyProfile: true, profileDisplayName: "Profilim", profileUserID: "")
                    }
                } else {
                    SignUpView()
                }
                
            }
            
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profil")
                }
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
        
    }
}

#Preview {
    ContentView()
    
}
