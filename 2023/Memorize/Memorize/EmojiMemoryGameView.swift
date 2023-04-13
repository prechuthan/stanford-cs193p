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
        //        ScrollView {
        //            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
        //                ForEach(game.cards) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    game.choose(card)
                }
        })
        
        //                }
        //            }
        //        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
        
    }
    
    struct CardView: View {
        let card: EmojiMemoryGame.Card
        
        var body: some View {
            GeometryReader { geomerty in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    if card.isFaceUp {
                        shape.fill(.white)
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        Text(card.content).font(font(in: geomerty.size))
                    } else if card.isMatched {
                        shape.opacity(0)
                    } else {
                        shape.fill()
                    }
                }
            }
        }
        
        private func font(in size: CGSize) -> Font {
            Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
        }
        
        private struct DrawingConstants {
            static let cornerRadius: CGFloat = 20
            static let lineWidth: CGFloat = 3
            static let fontScale: CGFloat = 0.8
        }
    }
    
    struct EmojiMemoryGameView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
        }
    }
}
