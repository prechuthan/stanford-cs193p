//
//  Array+Only.swift
//  Memorize
//
//  Created by Preshant Achuthan on 22/12/20.
//

import Foundation

extension Array {
    var only: Element? {
        self.count == 1 ? first : nil
    }
}
