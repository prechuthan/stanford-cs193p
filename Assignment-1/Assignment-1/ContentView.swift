//
//  ContentView.swift
//  Assignment-1
//
//  Created by Preshant Achuthan on 2/9/20.
//  Copyright © 2020 Preshant Achuthan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var emojiMemoryGameViewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        HStack {
            ForEach(emojiMemoryGameViewModel.cards) { card in
                CardView(card: card, totalNumberOfPairs: self.emojiMemoryGameViewModel.cards.count/2).onTapGesture {
                    self.emojiMemoryGameViewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .aspectRatio(CGSize(width: 2, height: 3), contentMode: ContentMode.fit)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var totalNumberOfPairs: Int
    
    var body: some View {
        ZStack {
            if (card.isFaceUp) {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                // Set font size based on number of card pairs
                (totalNumberOfPairs > 4) ?
                    Text(card.content).font(Font.subheadline) : Text(card.content).font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiMemoryGameViewModel: EmojiMemoryGameViewModel())
    }
}

