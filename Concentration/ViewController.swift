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
    
    lazy var game = Concentration(NumberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // set the initial theme at random based on available defined themes
    lazy var currentTheme = possibleGameThemes[Int(arc4random_uniform(UInt32(possibleGameThemes.count)))]
    
    // define the potential set of themes that could be used for the game
    // to add another theme, simply add another gameTheme struct with the initial values set as desired
    
    var possibleGameThemes = [gameTheme(    themeName: "Halloween",
                                            backgroundViewColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices: ["👻","🎃","🍎","👿","👹","😸","🍬","🍭","💀","🐸","🐶","🦇"]),
                              gameTheme(    themeName: "Sports",
                                            backgroundViewColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices:
                                ["🏈","🏀","🏊‍♀️","🏌🏼‍♂️","🏋🏻‍♂️","🏐","🤺","🏄🏼‍♀️","🚴🏽‍♀️","🏓","🏹","🎳"]),
                              gameTheme(    themeName: "Animals",
                                            backgroundViewColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices:
                                ["🦋","🦆","🐢","🐟","🐘","🐫","🦒","🐖","🐿","🦏","🐍","🐂"]),
                              gameTheme(    themeName: "Food",
                                            backgroundViewColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices:
                                ["🍎","🍐","🍇","🥑","🍔","🥦","🍒","🍅","🥨","🧀","🥚","🍗"]),
                              gameTheme(    themeName: "Travel",
                                            backgroundViewColor: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices:
                                ["🚌","🚲","🏍","🚛","🚂","🚁","✈️","🚆","🚤","🚀","🏎","⛵️"]),
                              gameTheme(    themeName: "Flags",
                                            backgroundViewColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
                                            cardTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            cardBackColor:  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),
                                            cardFrontColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                            emojiChoices:
                                ["🏁","🇦🇩","🇦🇷","🇦🇺","🇧🇪","🇧🇷","🇨🇦","🇨🇱","🇨🇺","🇩🇰","🇫🇷","🇺🇸"])]
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountlabel: UILabel!
    
    @IBOutlet weak var gameScoreLabel: UILabel!
    
    override func viewDidLoad() {
        // set the background color for this view
            self.view.backgroundColor = currentTheme.backgroundViewColor
            updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
      
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else
        {
            print("card not found in cardButtons")
        }
        
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        // Instantiate a new game
        game = Concentration(NumberOfPairsOfCards: (cardButtons.count + 1) / 2)
        // get new theme
        currentTheme = possibleGameThemes[Int(arc4random_uniform(UInt32(possibleGameThemes.count)))]
        
        // clear out dictionary
        emoji.removeAll()
        // set new background color and font colors
        self.view.backgroundColor = currentTheme.backgroundViewColor
        flipCountlabel.textColor = currentTheme.cardBackColor
        gameScoreLabel.textColor = currentTheme.cardBackColor
        
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        // check through each card to determine how to display
        for index in cardButtons.indices {
            let button = cardButtons[index] // get the UI Button
            let card = game.cards[index]    // get the model card
            // now set the appearance of the card based on its state
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = currentTheme.cardFrontColor
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : currentTheme.cardBackColor
            }
        }
        // update the flip count and score
        flipCountlabel.text = "Flips: \(game.flipCount)"
        gameScoreLabel.text = "Score: \(game.gameScore)"
    }
    
    // var emojiChoices = ["👻","🎃","🍎","👿","👹","😸","🍬","🍭","💀","🐸","🐶","🦇"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, currentTheme.emojiChoices.count > 0  {
            let randomIndex = Int(arc4random_uniform(UInt32(currentTheme.emojiChoices.count)))   // pick an emoji at random
            emoji[card.identifier] = currentTheme.emojiChoices.remove(at: randomIndex)           // use and remove so this emoji can't be used again
        }
        return emoji[card.identifier] ?? "?"  // if !nil return value, else return "?"
    }
}


