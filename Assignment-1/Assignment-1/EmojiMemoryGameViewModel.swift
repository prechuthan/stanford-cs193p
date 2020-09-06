//
//  EmojiMemoryGameViewModel.swift
//  Assignment-1
//
//  Created by Preshant Achuthan on 3/9/20.
//  Copyright © 2020 Preshant Achuthan. All rights reserved.
//

import Foundation

class EmojiMemoryGameViewModel {
    
    private var memoryGame: MemoryGame<String> = EmojiMemoryGameViewModel.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojiPool = ["👻","🎃", "🕷", "🦄", "🙉", "🐹", "❤️", "💊", "💣", "🐙", "🐼", "👞"]
        var emojis: Array<String>
        emojis = Array<String>()
        
        let randomNumberOfPairs = Int.random(in: 2...5)
        for _ in (0..<randomNumberOfPairs) {
            let randomEmoji = emojiPool.randomElement()!
            emojis.append(randomEmoji)
            emojiPool = emojiPool.filter { $0 != randomEmoji }
            
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { (pairIndex) -> String in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        memoryGame.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
