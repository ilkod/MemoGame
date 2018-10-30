//
//  Card.swift
//  Memo
//
//  Created by Shlyushka on 11.10.2018.
//  Copyright © 2018 shlyushka. All rights reserved.
//

import Foundation

struct Card {
    
    var isMatched = false
    var identifierOfCard: Int
    var isFaceUp = false
    
    
    
    static var identifierFactory = 0
    
    static func createUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifierOfCard = Card.createUniqueIdentifier()
    }
    
    
}
