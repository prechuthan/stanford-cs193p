//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Preshant Achuthan on 31/3/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
