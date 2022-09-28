//
//  MemoryGame.swift
//  Memorise
//
//  Created by Preshant Achuthan on 28/9/22.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card {
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
    private(set) var cards: Array<Card>
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            var content = createCardContent(pairIndex)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
}
