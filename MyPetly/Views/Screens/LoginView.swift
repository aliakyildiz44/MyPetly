//
//  Login.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI


struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var userIsLoggedIn = false
    @State var showRegister: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        
        ZStack {
            
            Color.MyTheme.purpleColor
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [Color.MyTheme.yellowColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(20))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("MyPetly")
                    .foregroundColor(Color.MyTheme.purpleColor)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(Color.MyTheme.yellowColor)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.white)
                
                SecureField("Şifre", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Şifre")
                            .foregroundColor(Color.MyTheme.yellowColor)
                            .bold()
                        
                    }
                
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.white)
                
                Button{
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    Text("Giriş Yap")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [Color.MyTheme.yellowColor], startPoint: .top, endPoint: .bottomTrailing)))
                    
                        .foregroundColor(Color.MyTheme.purpleColor)
                    
                }
                
                .padding(.top, 54)
                
                Button {
                    showRegister.toggle()
                } label: {
                    Text("Zaten hesabınız var mı?")
                    Text("Giriş Yap")
                        .bold()
                }
                .foregroundColor(Color.MyTheme.yellowColor)
                .font(.system(size: 20))
                .padding(.top)
                .offset(y:110)
            }
                
            .fullScreenCover(isPresented: $showRegister, content: {
                RegisterView()
            })

                
                .frame(width: 350)
                
            }
            .ignoresSafeArea()
        }
        
       
    }
    
    #Preview {
        LoginView()
    }
    
    extension View {
        func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {
                
                ZStack(alignment: alignment) {
                    placeholder().opacity(shouldShow ? 1 : 0)
                    self
                }
            }
    }
