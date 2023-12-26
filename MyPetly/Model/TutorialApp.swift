//
//  TutorialApp.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI

@main
struct TutorialApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
