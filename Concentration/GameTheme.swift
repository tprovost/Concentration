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
	var emojiChoices : String
    
}

// We may want to have multiple themes available, so define e
// theme array to contain these options.

var possibleGameThemes = [gameTheme(    themeName: "Halloween",
										backgroundViewColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "👻🎃🍎👿👹😸🍬🍭💀🐸🐶🦇"),
						  gameTheme(    themeName: "Sports",
										backgroundViewColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "🏈🏀🏊‍♀️🏌🏼‍♂️🏋🏻‍♂️🏐🤺🏄🏼‍♀️🚴🏽‍♀️🏓🏹🎳"),
						  gameTheme(    themeName: "Animals",
										backgroundViewColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "🦋🦆🐢🐟🐘🐫🦒🐖🐿🦏🐍🐂"),
						  gameTheme(    themeName: "Food",
										backgroundViewColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "🍎🍐🍇🥑🍔🥦🍒🍅🥨🧀🥚🍗"),
						  gameTheme(    themeName: "Travel",
										backgroundViewColor: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "🚌🚲🏍🚛🚂🚁✈️🚆🚤🚀🏎⛵️"),
						  gameTheme(    themeName: "Flags",
										backgroundViewColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
										cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
										cardBackColor:  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),
										cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
										emojiChoices: "🏁🇦🇩🇦🇷🇦🇺🇧🇪🇧🇷🇨🇦🇨🇱🇨🇺🇩🇰🇫🇷🇺🇸")]




