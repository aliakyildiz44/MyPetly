//
//  ListView.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var DataManager: DataManager
    
    
    
    var body: some View {
        NavigationView {
            List(DataManager.dogs, id: \.id) { dog in
                Text(dog.name)

            }
        }
    }
}

#Preview {
    ListView()
}
