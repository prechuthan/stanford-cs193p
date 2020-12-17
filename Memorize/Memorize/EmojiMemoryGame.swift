//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 17/12/20.
//

import SwiftUI

class EmojiMemoryGame {
    private var game: MemoryGame<String> = EmojiMemoryGame.createGame()
    
    static func createGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    
}
