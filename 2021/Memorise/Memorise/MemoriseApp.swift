//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Preshant Achuthan on 27/9/22.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let game = MemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
