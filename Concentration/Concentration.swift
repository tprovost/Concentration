//
//  Concentration.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/17/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var gameScore = 0
	private var indexOfOneAndOnlyFaceUpCard : Int? {
		get {  // use the "filter" method on the cards collection to find any cards that are face up -- determined by function passed as a closure
			   // then that uses the extension to return the one found (or nil)
			
			return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly // use extension instead of checking as below
			
//			return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
			
//			var foundIndex: Int?
//			for index in cards.indices {
//				if cards[index].isFaceUp {
//					if foundIndex == nil {
//						foundIndex = index
//					} else {
//						return nil  // more than 1 card face up
//					}
//				}
//			}
//			return foundIndex  // either found the one or returns initial value of nil
		}
		
		set { // input value defaults to param call newValue
			for index in cards.indices	{
				cards[index].isFaceUp = (index == newValue) // sets all false except matching index to true
			}
		}
	}
	
    
	// MARK:  Handle logic when card is selected.
	
	// TODO: simplify this logic to only set hasbeenseen once and also not set faceup as computed var should do this for us
	
	func chooseCard( at index: Int) {
		// insure (assert) index is properly in range
		assert(cards.indices.contains(index), "Concentration.chooseCard (at:\(index)): value not in range")
		
        flipCount += 1  // increment the flip count as card was touched
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    // they match
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    gameScore += 2
                } else {
                // check to see if we have chosen (seen) this card before.  If so,
                // we penalize the score becasue we chose it but did not match
                    if cards[index].hasBeenSeen {
                        gameScore -= 1
                    }
                }
                // in match or no match, set the chosen card as faceup and mark no longer
                // only one card face up.  Also record that this card has been seen
                cards[index].isFaceUp = true
                cards[index].hasBeenSeen = true
            } else {
                // no cards or 2 cards face up
                // except the one just picked needs to be face up and marked as only one
                cards[index].hasBeenSeen = true
                indexOfOneAndOnlyFaceUpCard = index  // the set method flips all the cards down and this one up
            }
        }

    }
    
    
    func shuffle(theCards: [Card]) -> [Card] {
        //  shuffle the cards and return the shuffled cards using Fisher-Yates algorithm
        var shuffledCards = theCards
        var cardIndex = shuffledCards.count - 1
        while cardIndex > 0 {
            let switchIndex = Int(arc4random_uniform(UInt32(cardIndex)))
            let tempCard = shuffledCards[cardIndex]
            shuffledCards[cardIndex] = shuffledCards[switchIndex]
            shuffledCards[switchIndex] = tempCard
            cardIndex -= 1
        }
        
        return shuffledCards
    }
    
    //  Initialize the cards to be played by creating pairs of cards and inserting them
    //  into the cards array.
    
    init(NumberOfPairsOfCards: Int) {
		assert(NumberOfPairsOfCards > 0, "Concentration.init(\(NumberOfPairsOfCards)) : must specify at least 1 pair of cards")
		
        for _ in 1...NumberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        
        // shuffle the cards = use Fisher-Yates
        cards = shuffle(theCards: cards)
    }
}

// extend Collections to determine if there is OneAndOnlyOne of the item in question in the collection
// use the generic Element to make this apply to all collections

extension Collection {
	var oneAndOnly : Element? {
		return count == 1 ? first : nil // if there is only 1 in the array, return it, else nil
	}
	
}
