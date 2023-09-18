//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Preshant Achuthan on 31/3/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
