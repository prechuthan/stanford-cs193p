//
//  MemoryGame.swift
//  Practise-Memorize
//
//  Created by Preshant Achuthan on 6/9/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose() {
        print("logic for card chosen")
    }
    
    struct Card: Identifiable {
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
