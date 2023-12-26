//
//  SettingsRowView.swift
//  MyPetly
//
//  Created by Ali on 20.12.2023.
//

import SwiftUI

struct SettingsRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    
    var body: some View {
        
        HStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: leftIcon)
                    .font(.title3)
                    .foregroundColor(.white)

            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundColor(.primary)
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SettingsRowView(leftIcon: "heart.fill", text: "Başlık", color: .red)
        .previewLayout(.sizeThatFits)
}
