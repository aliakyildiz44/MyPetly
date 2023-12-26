//
//  ProfileView.swift
//  MyPetly
//
//  Created by Ali on 19.12.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var isMyProfile: Bool
    @State var profileDisplayName: String
    var profileUserID: String
    
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        })
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                
            Button(action: {
            showSettings.toggle()
            
        }, label: {
            Image(systemName: "line.horizontal.3")
        })
                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                .opacity(isMyProfile ? 1.0 : 0.0)
        )
                .sheet(isPresented: $showSettings, content: {
                    SettingsView()
        })
    }
}

#Preview {
    NavigationView {
        ProfileView(isMyProfile: true, profileDisplayName: "Ali", profileUserID: "")
    }
}
