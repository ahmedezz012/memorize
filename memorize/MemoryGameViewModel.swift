//
//  MemoryGameViewModel.swift
//  memorize
//
//  Created by Ahmed Ezz on 23/01/2023.
//

import Foundation

class MemoryGameViewModel {
    
    private static let emojis : [String] = [
        "🐬","🐳","🐋","🦈","🦑",
        "🦐","🦞","🦀","🐟","🐙",
        "🦭","🦧","🐊","🦜","🐏",
        "🐘","🦓","🦏","🦚","🦉"
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(6) { index in
            return MemoryGameViewModel.emojis[index]
        }
    }
    
    var memoryGame: MemoryGame = createMemoryGame()
    
    
    var cards : Array<MemoryGame<String>.Card> {
        memoryGame.cards
    }
    
}
