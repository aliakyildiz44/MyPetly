//
//  Root.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI

struct Root: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    Root()
}
