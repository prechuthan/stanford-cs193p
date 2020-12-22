//
//  ContentView.swift
//  Memorize
//
//  Created by Preshant Achuthan on 13/12/20.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var emojiMemoryGame: MemoryGameViewModel
    
    var body: some View {
        Grid(emojiMemoryGame.cards) { card in
            CardView(card: card).onTapGesture {
                emojiMemoryGame.choose(card: card)
            }
            .padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @ViewBuilder
    var body: some View {
        if card.isFaceUp || !card.isMatched {
            GeometryReader { geometry in
                ZStack {
                    Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                }
                .cardify(isFaceUp: card.isFaceUp)
                    
                   
            }
        }
    }
    
    // MARK: - Drawing Constnants
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel()
        game.choose(card: game.cards[0])
        return MemoryGameView(emojiMemoryGame: game)
    }
}
