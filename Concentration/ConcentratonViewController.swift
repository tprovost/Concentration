//
//  ViewController.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/16/18.
//  Copyright © 2018 IAO. All rights reserved.
//

import UIKit

class ConcentratonViewController: UIViewController {

    // initialize game
    
    private lazy var game = Concentration(NumberOfPairsOfCards: numberOfPairsOfCards)
	
	var numberOfPairsOfCards : Int {
		// ReadOnly property so don't need Get
			return((cardButtons.count + 1) / 2)
	}
    
    // set the initial theme from the theme chooser view controller
	var currentTheme: gameTheme? = nil {
		didSet {
			if currentTheme != nil {
				attributes = [
				   .strokeWidth : -3.0,
				   .strokeColor : currentTheme!.cardBackColor
				]
			}
		}
	}
    
    // define the potential set of themes that could be used for the game
    // to add another theme, simply add another gameTheme struct with the initial values set as desired
    
	
	@IBOutlet var cardButtons: [UIButton]!
	
	
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
            self.view.backgroundColor = currentTheme?.backgroundViewColor
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
       
		// TODO:  Go back to Theme chooser screen to get the theme for the new game
		
		navigationController?.popViewController(animated: true)
//		splitViewController?.viewControllers[1].removeFromParent()
		
		// get new theme
        currentTheme = nil
//			possibleGameThemes[Int(arc4random_uniform(UInt32(possibleGameThemes.count)))]
        
        // clear out dictionary
        emoji.removeAll()
        // set new background color and font colors
        self.view.backgroundColor = currentTheme?.backgroundViewColor
		
		
		 
        updateViewFromModel()
    }
	
    private func updateViewFromModel() {
        // check through each card to determine how to display
		if currentTheme != nil {
			for index in cardButtons.indices {
				let button = cardButtons[index] // get the UI Button
				let card = game.cards[index]    // get the model card
				// now set the appearance of the card based on its state
				if card.isFaceUp {
					button.setTitle(emoji(for: card), for: UIControl.State.normal)
					button.backgroundColor = currentTheme?.cardFrontColor
				} else {
					button.setTitle("", for: UIControl.State.normal)
					button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : currentTheme?.cardBackColor
				}
			}
			
			// update the flip count and score
			updateFlipCountLabel()
			updateGameScoreLabel()
		}
    }
    
	private func updateFlipCountLabel() {
		flipCountlabel.attributedText = NSAttributedString(string:"Flips: \(game.flipCount)", attributes:attributes)
	}
	
	private func updateGameScoreLabel() {
		gameScoreLabel.attributedText = NSAttributedString(string: "Score: \(game.gameScore)", attributes: attributes)
	}
	
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, currentTheme!.emojiChoices.count > 0  {
			let randomStringIndex = currentTheme!.emojiChoices.index(currentTheme!.emojiChoices.startIndex, offsetBy: currentTheme!.emojiChoices.count.arc4random)
            emoji[card] = String(currentTheme!.emojiChoices.remove(at: randomStringIndex))       // use and remove so this emoji can't be used again
        }
        return emoji[card] ?? "?"  // if !nil return value, else return "?"
    }
}

// extend Int to provide a random number between 0..theIntvalue-1.  Simplifies use in picking emojis in our application

//extension Int {
//	var arc4random : Int {
//		if self > 0 {
//			return Int(arc4random_uniform(UInt32(self)))
//		} else if self < 0 {
//			return -Int(arc4random_uniform(UInt32(abs(self))))
//		} else {
//			return 0
//		}
//	}
//}


