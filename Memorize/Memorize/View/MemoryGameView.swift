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
        VStack {
            Grid(emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.25)) {
                        emojiMemoryGame.choose(card: card)
                    }
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    self.emojiMemoryGame.resetGame()
                }
            }, label: { Text("New Game") })
        }
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
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .rotation3DEffect(Angle.degrees(card.isFaceUp ? 0 : 180), axis: (0, 1, 0))
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
