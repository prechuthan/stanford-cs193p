//
//  ContentView.swift
//  Memorize
//
//  Created by Preshant Achuthan on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 5)
            Text("Hello World")
        }
        .padding()
        .foregroundColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
