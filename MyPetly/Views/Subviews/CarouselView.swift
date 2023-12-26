//
//  CarouselView.swift
//  MyPetly
//
//  Created by Ali on 16.12.2023.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 1
    let maxCount: Int = 8
    @State var timerAdded: Bool = false
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            ForEach(1..<8) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .onAppear(perform: {
            if !timerAdded {
                addTimer()
            }
        })
    }
    //Fonksiyonlar
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            
            if selection == (maxCount - 1) {
                selection = 1
            } else {
                selection += 1
            }
        }
        timer.fire()
    }
}

#Preview {
    CarouselView()
        .previewLayout(.sizeThatFits)
        
}
