//
//  Memo.swift
//  Concentration
//
//  Created by Shlyushka on 11.10.2018.
//  Copyright © 2018 shlyushka. All rights reserved.
//

import Foundation

class MemoGame {
    
    var arrayOfCards = [Card]()
    var numberOfMatches: Int = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            
            for index in arrayOfCards.indices{
                if arrayOfCards[index].isFaceUp{
                if foundIndex == nil {
                    foundIndex = index
                }else {
                    return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in arrayOfCards.indices{
                arrayOfCards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func touchCard(at identifierOfCard: Int){
        if !arrayOfCards[identifierOfCard].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != identifierOfCard {
            //check if two selected cards make a match
                
                if arrayOfCards[matchIndex].identifierOfCard == arrayOfCards[identifierOfCard].identifierOfCard{
                    arrayOfCards[matchIndex].isMatched = true
                    arrayOfCards[identifierOfCard].isMatched = true
                    numberOfMatches += 1
                }
                arrayOfCards[identifierOfCard].isFaceUp = true                    
                
            }else {
                indexOfOneAndOnlyFaceUpCard = identifierOfCard
            }
        
        }
    }
    
    init(numbersOfPairsOfCards: Int) {
        //TODO Shuffle cards
        
        for _ in 0..<numbersOfPairsOfCards {
            let card = Card()
            
            arrayOfCards.append(card)
            arrayOfCards.append(card)
        }
        
        arrayOfCards.shuffle()
    }
}

extension Int {
    func randomNumber()-> Int{
        return Int(arc4random_uniform(UInt32(self * 2)))
    }
}


