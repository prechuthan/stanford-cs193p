//
//  MemoryGameViewModel.swift
//  Memorise
//
//  Created by Preshant Achuthan on 28/9/22.
//

import SwiftUI

class MemoryGameViewModel {
    static let emojis = ["😊", "🙃", "🥲", "🥰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
                emojis[pairIndex] }
    }
    
    private(set) var model = createMemoryGame()
}
