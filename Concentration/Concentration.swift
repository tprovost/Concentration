//
//  Concentration.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/17/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var flipCount = 0
    var gameScore = 0
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard( at index: Int) {
        flipCount += 1  // increment the flip count as card was touched
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
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
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // no cards or 2 cards face up
                // turn all the cards facedown
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                // except the one just picked needs to be face up and marked as only one
                cards[index].isFaceUp = true
                cards[index].hasBeenSeen = true
                indexOfOneAndOnlyFaceUpCard = index
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
        for _ in 1...NumberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        
        // shuffle the cards = use Fisher-Yates
        cards = shuffle(theCards: cards)
    }
}
