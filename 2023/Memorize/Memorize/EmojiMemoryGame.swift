//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 7/4/23.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["👨‍🎤","💠","🔣","🌞","🌖","🚜","⬆️","🍉","🙋","🤴","⏳","🏊‍♂️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model = EmojiMemoryGame.createMemoryGame()
    
    var card: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
