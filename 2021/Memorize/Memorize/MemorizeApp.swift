//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Preshant Achuthan on 17/11/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
