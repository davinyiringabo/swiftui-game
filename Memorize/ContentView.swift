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
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()

        }
        .padding()
        .foregroundStyle(.orange)
        
    }
}


struct CardView: View {
    @State var isFacedUp = true
    var body: some View {
        ZStack { // similar to divs
//            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            let base = RoundedRectangle(cornerRadius: 12) // Type inference in Swift

            if isFacedUp {
                base.foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text("👽").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
        .onTapGesture {
            print("Tapped!")
//            isFacedUp = !isFacedUp
            isFacedUp.toggle() // to change from true to false and vise
        }
    }
}








#Preview {
    ContentView()
}
