//
//  RegisterView.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dissmiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.MyTheme.purpleColor
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [Color.MyTheme.purpleColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(20))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("MyPetly")
                    .foregroundColor(Color.MyTheme.yellowColor)
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
                
                TextField("İsim", text: $name)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: name.isEmpty) {
                        Text("İsim")
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
                
                SecureField("Şifre", text: $confirmPassword)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: confirmPassword.isEmpty) {
                        Text("Şifre Tekrar")
                            .foregroundColor(Color.MyTheme.yellowColor)
                            .bold()
                        
                    }
                
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.white)
                
                Button{
                    Task {
                        try await viewModel.createUser(withEmail: email, password: password, name: name)
                    }
                } label: {
                    Text("Kayıt Ol")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [Color.MyTheme.yellowColor], startPoint: .top, endPoint: .bottomTrailing)))
                    
                        .foregroundColor(Color.MyTheme.purpleColor)
                    
                }
                
                .padding(.top)
                .offset(y: 100)
                
                
                    Button {
                        dissmiss()
                    } label: {
                        Text("Zaten Hesabınız Var mı?")
                        Text("Giriş Yap")
                            .bold()
                    }
                    .foregroundColor(Color.MyTheme.yellowColor)
                    .font(.system(size: 20))
                    .padding(.top)
                    .offset(y:110)
                }
                
                .frame(width: 350)
                
            }
            .ignoresSafeArea()
        }
        
        
    }
    
    #Preview {
        RegisterView()
    }
    
    
