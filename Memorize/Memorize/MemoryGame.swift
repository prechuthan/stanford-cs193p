//
//  MemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 31/8/20.
//  Copyright © 2020 Preshant Achuthan. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int 
    }
    
    var cards: Array<Card>
    
    var indexOfOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(card: Card) {
        print("card: \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchindex = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchindex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchindex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }

}
