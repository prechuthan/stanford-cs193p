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
        HStack {
            ForEach(emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    emojiMemoryGame.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constnants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(emojiMemoryGame: MemoryGameViewModel())
    }
}
