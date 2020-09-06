//
//  MemoryGame.swift
//  Assignment-1
//
//  Created by Preshant Achuthan on 3/9/20.
//  Copyright © 2020 Preshant Achuthan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
    
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        
        cards.shuffle()
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
}
