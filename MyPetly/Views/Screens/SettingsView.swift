//
//  SettingsView.swift
//  MyPetly
//
//  Created by Ali on 20.12.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                // MARK: Bölüm 1: MyPetly
                GroupBox(label: SettingsLabelView(labelImage: "dot.radiowaves.left.and.right", labelText: "MyPetly"), content: {
                    HStack(alignment: .center, spacing: 10 , content: {
                            
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("Bağlantıyı kur, paylaşımı artır! Hayvanlar için sosyal medya uygulamamızda profilini kişiselleştir, arkadaşlarına katıl, ve sevimli dostlarınla etkileşimde bulunmak için bir dünya dolusu seçeneği keşfet :)")
                            .font(.footnote)
                            
                    })
                })
                .padding()
                
                // MARK: BÖLÜM 2: PROFİL
                GroupBox(label: SettingsLabelView(labelImage: "person.fill", labelText: "Profil"), content: {
                    
                    NavigationLink(
                       destination: SettingsEditTextView(submissionText: "Güncel Kullanıcı Adınız", title: "Kullanıcı Adı", description: "Burada kullanıcı adını değiştirebilirsin.Yaptığın değişiklik diğer kullanıcılar tarafından ve gönderilerinde gözükecektir.", placeholder: "Kullanıcı Adın..."),
                                   label: {
                        SettingsRowView(leftIcon: "pencil", text: "Kullanıcı Adı", color: Color.MyTheme.purpleColor)
                    })
                    
                    
                    NavigationLink(
                        destination: SettingsEditTextView(submissionText: "Güncel Biyografiniz", title: "Biyografi", description: "Biyografiniz, diğer kullanıcılara sizin hakkınızda daha fazla bilgi edinmeleri için mükemmel bir fırsattır. Kendinizi ifade etmek için bu alanı yaratıcı ve özgün bir şekilde kullanın :)", placeholder: "Biyografiniz...") ,
                                   label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Biyografi", color: Color.MyTheme.purpleColor)
                    } )
                    
                    NavigationLink(
                        destination: SettingsEditImageView(title: "Profil Resmi", description: "Yeni profil resmini yüklemeye ne dersin? Dostların seni tanımasını sağla, en sevdiğin anları paylaş! 🐾📸 #YeniProfilResmi", selectedImage: UIImage(named: "dog1")!),
                                   label: {
                        SettingsRowView(leftIcon: "photo", text: "Profil Resmi", color: Color.MyTheme.purpleColor)
                    })
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Çıkış", color: Color.MyTheme.purpleColor)
                    
                    
                })
                .padding()
                
                // MARK: BÖLÜM3: UYGULAMA
                GroupBox(label: SettingsLabelView(labelImage: "apps.iphone", labelText: "Uygulama"), content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Gizlilik Politikası", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://yahoo.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Hükümler ve Koşullar Politikası", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://bing.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "MyPetly Website", color: Color.MyTheme.yellowColor)
                    })
                    
                })
                .padding()
                
                
                //MARK: BÖLÜM 4: HAKKINDA
                GroupBox{
                    Text("Mypetly, sevgiyle tasarlandı, sizin ve evcil dostlarınızın mutluluğu için burada! 🐾❤️ \n ®All Rights Reserved. \n ©Copyright 2024 \n Akyıldız Apps Inc.")
                        
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .padding(.bottom, 40)
                
            })
            
            .navigationBarTitle("Ayarlar")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
                                },  label: {
                                    Image(systemName: "xmark")
                                        .font(.title)
                                        
                                    })
                                        .accentColor(.primary)
                                
            )
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
    
    //MARK: FONKSİYONLAR
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}
