//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jozef Forgac on 13/02/2025.
//

import Foundation

struct MemoryGame<CardContent>where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfCards: Int,content: (Int)->CardContent){
        cards = []
        for index in 0...numberOfCards {
            cards.append(Card(content: content(index),id: "\(index)a"))
            cards.append(Card(content: content(index),id: "\(index)b"))
        }
    }
    
    mutating func choose(card: Card){
        if let index = cards.firstIndex(where: {$0.id == card.id}){
            cards[index].isFaceup.toggle()
        }
        
        var faceUpCards = cards.filter({ $0.isFaceup })
        
        if faceUpCards.count == 3{
            print("\(cards[0].content), \(cards[1].content)")
            if faceUpCards[0].content == faceUpCards[1].content{
                let index1 = cards.firstIndex(of: faceUpCards[0])
                let index2 = cards.firstIndex(of: faceUpCards[1])
                cards[index1!].isMatched = true
                cards[index2!].isMatched = true
                for index in cards.indices {
                    cards[index].isFaceup = false
                }
            }else{
                for index in cards.indices {
                    cards[index].isFaceup = false
                }
            }
        }
    }
    
    mutating func shuffleCards(){
        cards.shuffle()
    }
    
    struct Card: Equatable,Identifiable{
        var isFaceup: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
    }
}
