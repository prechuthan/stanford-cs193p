//
//  Array+Only.swift
//  Memorize
//
//  Created by Preshant Achuthan on 10/9/20.
//  Copyright © 2020 Preshant Achuthan. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
