//
//  MemoryGame.swift
//  memorize
//
//  Created by Ahmed Ezz on 23/01/2023.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(_ numberOfPairs: Int,_ createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairs {
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
    }
}
