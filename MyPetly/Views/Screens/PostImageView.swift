//
//  PostImageView.swift
//  MyPetly
//
//  Created by Ali on 19.12.2023.
//

import SwiftUI

struct PostImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var captionText: String = ""
    @Binding var imageSelected: UIImage
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                })
                .accentColor(.primary)
                
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400, alignment: .center)
                    .cornerRadius(15)
                    .clipped()
                
                TextField("Açıklamanızı Yazınız...", text: $captionText)
                    .padding()
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .font(.headline)
                    .padding(.horizontal)
                    .autocapitalization(.sentences)
                
                Button(action: {
                    postPicture()
                }, label: {
                    Text("Gönderİyİ Paylaş".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                        .cornerRadius(12)
                        .padding(.horizontal)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor : Color.MyTheme.purpleColor)
                

            })
            
        })
    }
    // Fonksiyonlar
    
    func postPicture() {
        print("Gönderiyi veritabanına gönder")
    }
}

struct PostImageView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "dog1")!
    
    static var previews: some View {
        PostImageView(imageSelected: $image)
            
    }
}
