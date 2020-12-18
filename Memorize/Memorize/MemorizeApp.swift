//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Preshant Achuthan on 13/12/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = MemoryGameViewModel()
            MemoryGameView(emojiMemoryGame: game)
        }
    }
}
