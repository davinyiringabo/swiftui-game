//
//  ContentView.swift
//  Memorize
//
//  Created by David NYIRINGABO on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView(isFacedUp: true)

        }
        .padding()
        .foregroundStyle(.orange)
        
    }
}


struct CardView: View {
    var isFacedUp: Bool = false
    var body: some View {
        ZStack(content: { // similar to divs
            if isFacedUp {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👽").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}








#Preview {
    ContentView()
}
