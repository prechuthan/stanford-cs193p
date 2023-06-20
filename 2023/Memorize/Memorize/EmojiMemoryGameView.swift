//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Preshant Achuthan on 31/3/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }
    
    struct CardView: View {
        let card: EmojiMemoryGame.Card
        
        var body: some View {
            GeometryReader { geomerty in
                ZStack {
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                        .padding(DrawingConstants.timerCirclePadding).opacity(DrawingConstants.timerCircleOpacity)
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geomerty.size))
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
        
        private func scale(thatFits size: CGSize) -> CGFloat {
            min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
        }
        
        
        private struct DrawingConstants {
            static let fontScale: CGFloat = 0.6
            static let fontSize: CGFloat = 32
            static let timerCirclePadding: CGFloat = 5
            static let timerCircleOpacity: CGFloat = 0.5
        }
    }
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            game.choose(game.cards.first!)
            return EmojiMemoryGameView(game: game)
        }
    }
}
