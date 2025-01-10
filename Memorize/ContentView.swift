//
//  ContentView.swift
//  Memorize
//
//  Created by David NYIRINGABO on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var countCard: Int = 4
    let emojies = ["👽", "👻", "👩🏿‍🦰", "👳‍♂️", "👽","👽", "👻", "👩🏿‍🦰", "👳‍♂️", "👽","👽", "👻", "👩🏿‍🦰", "👳‍♂️", "👽","👽", "👻", "👩🏿‍🦰", "👳‍♂️", "👽"]
    
    var body: some View {
        ScrollView{
            cards
        }
        Spacer()
        countCardsAdjuster
    
    }
    var countCardsAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.font(.largeTitle).padding()
    }
    func addRemoveCards(by offset: Int, symbol: String) -> some View {
        Button(action: {
                countCard += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled( countCard + offset < 1 || countCard + offset > emojies.count)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<countCard, id: \.self){ index in
                CardView(content: emojies[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
    
    var cardRemover: some View {
        addRemoveCards(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        addRemoveCards(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}


struct CardView: View {
    @State var isFacedUp = true
    var content: String
    var body: some View {
        ZStack { // similar to divs
//            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            let base = RoundedRectangle(cornerRadius: 12) // Type inference in Swift

            Group {
                base.foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
//                RoundedRectangle(cornerRadius: 12)
//            base.fill().opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
        }
        .onTapGesture {
//            isFacedUp = !isFacedUp
            isFacedUp.toggle() // to change from true to false and vise
        }
    }
}








#Preview {
    ContentView()
}
