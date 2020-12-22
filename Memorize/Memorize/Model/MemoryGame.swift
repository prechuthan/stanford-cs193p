//
//  MemoryGame.swift
//  Memorize
//
//  Created by Preshant Achuthan on 17/12/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            
            return faceUpCardIndices.only
        }
        
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyOneFaceUpCard = chosenIndex
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
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
