//
//  ContentView.swift
//  Memorise
//
//  Created by Preshant Achuthan on 27/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3.0)
            Text("😊")
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
