//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Igor on 24.12.2024.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "🎃", "🕷️", "🕸️", "💀", "🧙", "👹", "🍭", "😱", "🪦"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let numberOfPairsOfCards = 2//Int.random(in: 2 ..< 8)
        return MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return EmojiMemoryGame.emojis[pairIndex]
            } else {
                return "⚠️ func createMemoryGame() failed"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
