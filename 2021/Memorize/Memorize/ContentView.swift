//
//  ContentView.swift
//  Memorize
//
//  Created by Preshant Achuthan on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"]
    
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            // Scrollable grid layout for cards
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
            
            // Space between cards and action buttons
            Spacer()
            
            // Action buttons
            HStack{
                // Minus button
                Button(action: {
                    emojiCount > 0 ? emojiCount -= 1 : nil
                }, label: {
                    Image(systemName: "minus.circle")
                })
                
                // Space between minus and shuffle
                Spacer()
                
                // Shuffle button
                Button(action: {
                    emojis[0..<emojiCount].shuffle()
                }, label: {
                    Text("Shuffle")
                })
                
                // Space between shuffle and plus
                Spacer()
                
                // Plus button
                Button(action: {
                    emojiCount < emojis.count ? emojiCount += 1 : nil
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
            .font(.title)
            .foregroundColor(.purple)
            .padding(.horizontal)
            
        } // end of VStack
        
        
    }
}

struct CardView: View {
    var content: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0).fill(.white)
            RoundedRectangle(cornerRadius: 25.0).strokeBorder(lineWidth: 5)
            Text(content)
                .font(.largeTitle)
        }
        .foregroundColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
