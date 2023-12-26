//
//  SettingsEditImageView.swift
//  MyPetly
//
//  Created by Ali on 20.12.2023.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage //Ekranda gösterilen resim
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(100)
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Yükle".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker, content: {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            })
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Kaydet".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.yellowColor)

            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
        
    }
}
    
    struct SettingsEditImageView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                SettingsEditImageView(title: "Title", description: "desciption", selectedImage: UIImage(named: "dog1")!)
            }
        }
    }
