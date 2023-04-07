//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 7/4/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["👨‍🎤","💠","🔣","🌞","🌖","🚜","⬆️","🍉","🙋","🤴","⏳","🏊‍♂️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
