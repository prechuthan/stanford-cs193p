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
        VStack {
            gameBody
            deckBody
            shuffle
        }
        .padding(.horizontal)
    }
    
    @State private var delt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        delt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !delt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
                CardView(card: card)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .scale))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            // "deal" cards
            withAnimation {
                for card in game.cards {
                    deal(card)
                }
            }
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
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
            return EmojiMemoryGameView(game: game)
        }
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
    }
}
