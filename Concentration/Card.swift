//
//  Card.swift
//  Concentration
//
//  Created by Burhan Otour on 24.02.20.
//  Copyright © 2020 Burhan Otour. All rights reserved.
//

import Foundation
/**
 * Two differences from classes:
 * 1. Structs have no inheritance
 * 2. Structs are value typed, arrays are structs and string are struced (passed by value)
 *      swift is smart enough to avoid performace overhead (it utilizes copy-on-write semantic)
 *
 */
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // Cards shoud be self responsible for assigning their own 
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // Init usually have the parameters to be both internal and external name
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
