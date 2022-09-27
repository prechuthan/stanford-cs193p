//
//  ContentView.swift
//  Practise-Memorize
//
//  Created by Preshant Achuthan on 5/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<12) { card in
                CardView()
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            
            shape.foregroundColor(.white)
            shape.strokeBorder(lineWidth: 5).foregroundColor(.indigo)
            Text("😊").font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
