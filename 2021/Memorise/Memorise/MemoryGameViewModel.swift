//
//  MemoryGameViewModel.swift
//  Memorise
//
//  Created by Preshant Achuthan on 28/9/22.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    static let emojis = ["😊", "🙃", "🥲", "🥰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
