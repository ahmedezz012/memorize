//
//  MemoryGame.swift
//  memorize
//
//  Created by Ahmed Ezz on 23/01/2023.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private let noIndex = -1
    private var lastSelectedItemIndex: Int?
    
    init(_ numberOfPairs: Int,_ createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairs {
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent, id: index*2))
            cards.append(Card(content: cardContent, id: index*2+1))
        }
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        let choosenCardIndex: Int? = cards.firstIndex(where: { $0.id == card.id })
        if canIChooseThisCard(forThisIndex: choosenCardIndex) {
            if let safeLastSelectedItemIndex = lastSelectedItemIndex {
                checkAndMatchCards(choosenCardIndex!, safeLastSelectedItemIndex)
                setLastSelectedItemIndex(nil)
            } else {
                faceDownAllUnMatchedCards()
                setLastSelectedItemIndex(choosenCardIndex!)
            }
            cards[choosenCardIndex!].isFaceUp.toggle()
        }
    }
    
    private func canIChooseThisCard(forThisIndex: Int?) -> Bool {
        if let safeChoosenCardIndex = forThisIndex,
            !cards[safeChoosenCardIndex].isFaceUp,
            !cards[safeChoosenCardIndex].isMatch {
            return true
        }
        return false
    }
    
    private mutating func setLastSelectedItemIndex(_ value: Int?) {
        lastSelectedItemIndex = value
    }
    
    private mutating func checkAndMatchCards(_ indexOne: Int,_ indexTwo: Int) {
        if indexOne != indexTwo,
            cards[indexOne].content == cards[indexTwo].content {
            cardIsMatched(indexTwo)
            cardIsMatched(indexOne)
        }
    }
    
    private mutating func cardIsMatched(_ index: Int) {
        cards[index].isMatch = true
    }
    
    private mutating func faceDownAllUnMatchedCards() {
        for index in cards.indices {
            if !cards[index].isMatch {
                cards[index].isFaceUp = false
            }
        }
    }
    
    private func index(of: Card) -> Int? {
        for i in 0..<cards.count {
            if of.id == cards[i].id {
                return i
            }
        }
        return nil
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
        var id: Int
    }
}
