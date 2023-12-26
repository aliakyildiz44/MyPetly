//
//  OnboardingView.swift
//  MyPetly
//
//  Created by Ali on 21.12.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    @State var showError: Bool = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image("logo.transparent")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .center)
            .shadow(radius: 12)
            
            Text("MyPetly'e Hoşgeldiniz")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("Merhaba! 🐾 Evcil dostların renkli dünyasına hoş geldin! Bu uygulama, sevimli arkadaşlarınızın fotoğraflarını ve hikayelerini paylaşmak, yeni dostlar edinmek ve evcil hayvansever bir topluluğa katıl. Hemen başlamak için 'Kayıt ol' butonuna tıkla. 😊")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            
            //MARK: SIGN IN WITH APPLE
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
            
            //MARK: SIGN IN WITH GOOGLE
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                HStack {
                    Image(systemName: "globe")
                    
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB,red:222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(5)
                .font(.system(size: 22, weight: .medium, design: .default))
            })
            .accentColor(Color.white)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Mİsafİr olarak devam et".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            })
            .accentColor(.black)
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2, content: {
            LoginView()
        })
        .alert(isPresented: $showError, content: {
            return Alert(title: Text("Error signing in"))
        })
    }
    
    
}

#Preview {
    OnboardingView()
}
