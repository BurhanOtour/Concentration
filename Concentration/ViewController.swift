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
    
    var emojiChoices: Array<String> = ["😺","👻","🎃","😺","👻","🎃"]
    
    // In swift, each argument has a name
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        // Optional: type that has two and only two states (set, not set)
        // For each case of an enumeration, there is an associated data
        // It return an Optional state and has an associated value with it
        // putting ! at the end of the optional object will return a value associated with the optional
        // ! : is called unwrapping an optional
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("card number = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("card is not part of the card index")
        }
    }

    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        // print("flipCard(withEmoji: \(   ))")
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

