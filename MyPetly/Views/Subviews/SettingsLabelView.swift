//
//  SettingsLabelView.swift
//  MyPetly
//
//  Created by Ali on 20.12.2023.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelImage: String
    var labelText: String
    var body: some View {
        VStack {
            HStack {
                
                Text(labelText)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: labelImage)
                
            }
            
            Divider()
                .padding(.vertical, 4)
            
        }
    }
}

#Preview {
    SettingsLabelView(labelImage: "Test label", labelText: "heart")
        .previewLayout(.sizeThatFits)
}
