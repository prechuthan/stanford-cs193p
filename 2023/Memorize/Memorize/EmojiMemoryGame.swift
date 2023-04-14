//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 7/4/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👨‍🎤","💠","🔣","🌞","🌖","🚜","⬆️","🍉","🙋","🤴","⏳","🏊‍♂️", "🥟", "🎄", "🦀", "🎈", "🍾", "🙉"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
