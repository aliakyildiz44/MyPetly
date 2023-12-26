//
//  ProfileHeaderView.swift
//  MyPetly
//
//  Created by Ali on 19.12.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var profileDisplayName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10,  content: {
            
            // MARK: Profil Resmi
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(60)
            
            // MARK: Kullanıcı Bölümü
            Text(profileDisplayName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // MARK: BİYOGRAFİ
            Text("Biyografi alanı")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .center, spacing: 20, content: {
                
                //MARK: GÖNDERİ
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("4")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    
                    Text("Gönderi")
                        .font(.callout)
                        .fontWeight(.medium)
                })
                //MARK: BEĞENİ
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("94")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    
                    Text("Beğeni")
                        .font(.callout)
                        .fontWeight(.medium)
                })
            })
        
        })
        .frame(maxWidth:.infinity)
        .padding()
    }
}

struct ProfileHeaderView_Preview: PreviewProvider {
    @State static var name: String = "Ali"
    
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
            .previewLayout(.sizeThatFits)
    }
}
