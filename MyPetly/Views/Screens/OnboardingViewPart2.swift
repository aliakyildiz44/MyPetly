//
//  OnboardingViewPart2.swift
//  MyPetly
//
//  Created by Ali on 21.12.2023.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
    @State var displayName: String = ""
    @State var showImagePicker: Bool = false
    
    // Image Picker İçin
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
           
            Text("Adınız Nedir?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.yellowColor)
            
            TextField("Adınızı Giriniz...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Bitir ve profil fotoğrafını ekle")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            })
            .accentColor(Color.MyTheme.purpleColor)
            .opacity(displayName != "" ? 1.0 : 0.0)
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showImagePicker, onDismiss: createProfile, content: {
            ImagePicker(imageSelected:$imageSelected , sourceType: $sourceType)
        })
    }
    
    //MARK: Fonksiyonlar

    func createProfile() {
        print("Şimdi profili oluştur")
    }
}

#Preview {
    OnboardingViewPart2()
}
