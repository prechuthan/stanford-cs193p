//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Preshant Achuthan on 23/12/20.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
