//
//  Card.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/17/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import Foundation
import UIKit

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var hasBeenSeen = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

