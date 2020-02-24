//
//  ViewController.swift
//  Concentration
//
//  Created by Burhan Otour on 21.02.20.
//  Copyright © 2020 Burhan Otour. All rights reserved.
//
// iOS framework which has buttons and sliders and all that Cocoa Touch
import UIKit
// Every construct starts with UI is part of the UIKit (example: UIViewController)
class ViewController: UIViewController {
    // Creating the "green arrow"
    // lazy means, it is not initilized until it is first use (but unfourtunatly we can't have didSet{..} property observers)
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // Keep track of the flip count (0 is the initialization value)
    var flipCount:Int = 0 {
        // This block called the property observer
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    // The "!" is SUPER important
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // An array of UIButtons / Array<UIButton>!
    @IBOutlet var cardButtons: [UIButton]!
    
    // In swift, each argument has a name
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        // Optional: type that has two and only two states (set, not set)
        // For each case of an enumeration, there is an associated data
        // It return an Optional state and has an associated value with it
        // putting ! at the end of the optional object will return a value associated with the optional
        // ! : is called unwrapping an optional
        if let cardNumber = cardButtons.firstIndex(of: sender) {
           // print("card number = \(cardNumber)")
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card is not part of the card index")
        }
    }

    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                if card.isMatched {
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                } else {
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
            }
        }
    }
    
    var emojiChoices: Array<String> = ["😺","👻","🎃","🦇","🍭","🍎","🍫","🤯","🏀"]
    
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String{
        // Swift doens't do automatic type conversion, Luckily UInt32 has initilizer that accepts Int and Int does the same ;)
        // Put back to back if on the same line seperating them by comma
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        /*if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
             return "?"
        }*/
        return emoji[card.identifier] ?? "?"
    }
   
}

