//
//  Card.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/17/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import Foundation
import UIKit

struct Card : Hashable
{
	var hashValue : Int { return identifier }
	
	static func ==(lhs:Card, rhs:Card) -> Bool {
		return lhs.identifier == rhs.identifier
	}
	
    var isFaceUp = false
    var isMatched = false
    var hasBeenSeen = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

