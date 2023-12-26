//
//  MyPetlyApp.swift
//  MyPetly
//
//  Created by Ali on 7.12.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import Firebase

@main
struct MyPetlyApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
