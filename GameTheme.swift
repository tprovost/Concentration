//
//  GameTheme.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/20/18.
//  Copyright © 2018 IAO. All rights reserved.
//
// This will define the data structures needed to support various themes in a game where we vary the background and card colors as well as the emoji symbols we use on the cards.

import Foundation
import UIKit

// Basic definition of the theme variables used to control the display view

struct gameTheme
{
    var themeName: String
    var backgroundViewColor: UIColor
    var cardTextColor: UIColor
    var cardBackColor: UIColor
    var cardFrontColor: UIColor
    var emojiChoices = Array<String>()
    
}

// We may want to have multiple themes available, so define e
// theme array to contain these options.



