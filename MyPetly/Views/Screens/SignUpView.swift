//
//  SignUpView.swift
//  MyPetly
//
//  Created by Ali on 20.12.2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnboarding: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Spacer()
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("Henüz oturum açmadınız!🙁 ")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("Merhaba! Evcil dostların dünyasına hoş geldin. Daha fazla içerik görmek ve sevimli arkadaşlarını paylaşmak için lütfen oturum aç veya bir hesap oluştur. 🐾✨")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Button(action: {
                showOnboarding.toggle()
                
            }, label: {
                Text("GİRİŞ Yap / Kayıt Ol".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
            .accentColor(Color.MyTheme.yellowColor)
            Spacer()
            Spacer()
            
        })
        .padding(.all, 40)
        .background(Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboarding, content: {
            RegisterView()
        })
    }
}

#Preview {
    SignUpView()
}
