//
//  ViewController.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/16/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // initialize game
    
    private lazy var game = Concentration(NumberOfPairsOfCards: numberOfPairsOfCards)
	
	var numberOfPairsOfCards : Int {
		// ReadOnly property so don't need Get
			return((cardButtons.count + 1) / 2)
	}
    
    // set the initial theme at random based on available defined themes
    private lazy var currentTheme = possibleGameThemes[Int(arc4random_uniform(UInt32(possibleGameThemes.count)))]
    
    // define the potential set of themes that could be used for the game
    // to add another theme, simply add another gameTheme struct with the initial values set as desired
    
    private var possibleGameThemes = [gameTheme(    themeName: "Halloween",
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
    
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
	@IBOutlet private weak var flipCountlabel: UILabel! {
		didSet {
			updateFlipCountLabel()
		}
	}
    
	@IBOutlet private weak var gameScoreLabel: UILabel! {
		didSet {
			updateGameScoreLabel()
		}
	}
    
    override func viewDidLoad() {
        // set the background color for this view
            self.view.backgroundColor = currentTheme.backgroundViewColor
            updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
      
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else
        {
            print("card not found in cardButtons")
        }
        
    }
	private var attributes: [NSAttributedString.Key : Any]?
	
	
    @IBAction private func newGameButton(_ sender: UIButton) {
        // Instantiate a new game
        game = Concentration(NumberOfPairsOfCards: numberOfPairsOfCards)
        // get new theme
        currentTheme = possibleGameThemes[Int(arc4random_uniform(UInt32(possibleGameThemes.count)))]
        
        // clear out dictionary
        emoji.removeAll()
        // set new background color and font colors
        self.view.backgroundColor = currentTheme.backgroundViewColor
		
		// set Score and Flip Count label attributes
		
		attributes = [
						.strokeWidth : -3.0,
						.strokeColor : currentTheme.cardBackColor
					 ]
		 
        updateViewFromModel()
    }
	
    private func updateViewFromModel() {
        // check through each card to determine how to display
        for index in cardButtons.indices {
            let button = cardButtons[index] // get the UI Button
            let card = game.cards[index]    // get the model card
            // now set the appearance of the card based on its state
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = currentTheme.cardFrontColor
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : currentTheme.cardBackColor
            }
        }
        // update the flip count and score
		updateFlipCountLabel()
		updateGameScoreLabel()
		
		//flipCountlabel.attributedText = NSAttributedString(string:"Flips: \(game.flipCount)", attributes:attributes)
		// gameScoreLabel.attributedText = NSAttributedString(string: "Score: \(game.gameScore)", attributes: attributes)
    }
    
	private func updateFlipCountLabel() {
		flipCountlabel.attributedText = NSAttributedString(string:"Flips: \(game.flipCount)", attributes:attributes)
	}
	
	private func updateGameScoreLabel() {
		gameScoreLabel.attributedText = NSAttributedString(string: "Score: \(game.gameScore)", attributes: attributes)
	}
	
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, currentTheme.emojiChoices.count > 0  {
			let randomStringIndex = currentTheme.emojiChoices.index(currentTheme.emojiChoices.startIndex, offsetBy: currentTheme.emojiChoices.count.arc4random)
            emoji[card] = String(currentTheme.emojiChoices.remove(at: randomStringIndex))       // use and remove so this emoji can't be used again
        }
        return emoji[card] ?? "?"  // if !nil return value, else return "?"
    }
}

// extend Int to provide a random number between 0..theIntvalue-1.  Simplifies use in picking emojis in our application

extension Int {
	var arc4random : Int {
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else if self < 0 {
			return -Int(arc4random_uniform(UInt32(abs(self))))
		} else {
			return 0
		}
	}
}


