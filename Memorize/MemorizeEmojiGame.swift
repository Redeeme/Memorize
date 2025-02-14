//
//  MemorizeEmojiGame.swift
//  Memorize
//
//  Created by Jozef Forgac on 13/02/2025.
//

import SwiftUI

class MemorizeEmojiGame: ObservableObject{
    
    static var scaryHalloweenEmojis = ["🎃", "👻", "🧛‍♂️", "💀", "🥶", "😱", "🧌", "😈",]
    
    static func createModel()->MemoryGame<String>{
        return MemoryGame(numberOfCards: scaryHalloweenEmojis.count){ index in
            if index >= scaryHalloweenEmojis.count{
                return "👮‍♂️"
            }
            return scaryHalloweenEmojis[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = createModel()
    
    func getCards()-> Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent
    func shuffleCards(){
        model.shuffleCards()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
