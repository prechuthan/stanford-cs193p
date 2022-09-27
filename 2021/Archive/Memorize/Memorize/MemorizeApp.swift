//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Preshant Achuthan on 19/8/22.
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
