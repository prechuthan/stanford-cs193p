//
//  ContentView.swift
//  Memorize
//
//  Created by Preshant Achuthan on 19/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
            Text("Hello, big big world!")
                .foregroundColor(.orange)
        }
        .padding()
        .foregroundColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
