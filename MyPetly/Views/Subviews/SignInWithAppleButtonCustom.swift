//
//  SignInWithAppleButtonCustom.swift
//  MyPetly
//
//  Created by Ali on 21.12.2023.
//

import Foundation
import SwiftUI
import AuthenticationServices


struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
