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
    
    // Keep track of the flip count
    // var flipCount: Int
    
    // In swift, each argument has a name
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

