//
//  Concentration.swift
//  Concentration
//
//  Created by Burhan Otour on 24.02.20.
//  Copyright © 2020 Burhan Otour. All rights reserved.
//
// Not UIKit this time (not a UI comonent)

import Foundation

class Concentration
{
    // As long as all of the vars in the class are initilized then the class will get the "free" initilizer
    
    // But here we will create our own init
    
    // This init() for the array struct with no argument mearns creating an empty array
    // Check the documenation for other arrays
    // Initially it is var cards: [Card] = [Card]() but type inference in swift do the job for us then (var cards = [Card]())
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are FaceUp
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
   
    init(numberOfPairsOfCards: Int)
    {
        // Loops in Swift iterates sequences or "countable range"
        // 0..<10 means from 0 to 9
        // 0...10 means from 0 to 10
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            /**
                            cards.append(card) could also be used
             */
        }
        // TODO: Shuffle the cards (homework)
    }
}
