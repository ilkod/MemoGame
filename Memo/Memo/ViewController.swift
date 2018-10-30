//
//  ViewController.swift
//  Memo
//
//  Created by Shlyushka on 10.10.2018.
//  Copyright © 2018 shlyushka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var game: MemoGame = MemoGame(numbersOfPairsOfCards: ((collectionOfButtons.count + 1) / 2))
    
    
    private(set) var flipCount = 0 {
        didSet {
             countLabel.text = "Flip count: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private var collectionOfButtons: [UIButton]!
    
    @IBAction private func touchButton(_ sender: UIButton) {
        flipCount += 1
        if game.numberOfMatches != game.arrayOfCards.count / 2{
        if let cardNumber = collectionOfButtons.index(of: sender){
            game.touchCard(at: cardNumber)
            updateGameView()
        }
        }else {
            let finalScore = flipCount
            let alert = UIAlertController(
                title: "You win!",
                message: "Score: \(flipCount)",
                preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(
                title: "Again",
                style: UIAlertAction.Style.default,
                handler: {action in
                    
                    self.viewDidLoad()
            }))
            
            alert.addAction(UIAlertAction(
                title: "Exit",
                style: UIAlertAction.Style.default,
                handler: {action in
                    self.countLabel.text = "Flip count: \(finalScore)"
                    exit(0)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //робимо для того, щоб оновлювати гру в окремому методі
    
    
    private func updateGameView(){
        for index in collectionOfButtons.indices {
            let button = collectionOfButtons[index]
            let card = game.arrayOfCards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2163901988, green: 0.3057344088, blue: 0.4582011421, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String{
        if emoji[card.identifierOfCard] == nil, emojiArray.count > 0 {
            let randomNumber = Int(arc4random_uniform(UInt32(emojiArray.count)))
            emoji[card.identifierOfCard] = emojiArray.remove(at: randomNumber)
        }
        
        return emoji[card.identifierOfCard] ?? "?"
    }
    
   private var emojiArray = ["🤡", "💩", "💀", "🤖", "💆🏻‍♂️", "🖕🏻", "💃🏻", "🔥", "🌈", "🧘🏼‍♀️", "🗽", "💈", "🖤", "⚠️", "♣️", "🌀", "👺", "🧚‍♀️", "👄","👠", "👡", "👢", "👞", "👟"]
    
 
}

