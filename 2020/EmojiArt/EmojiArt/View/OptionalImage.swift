//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Preshant Achuthan on 4/1/21.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
