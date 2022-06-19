//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ihor Terletskyi on 08.05.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["🚌",  "🏎", "🛵", "🚑", "🚗",
                  "🚕", "🚙", "🚛", "🚜", "🚁",
                  "🚀", "🛸", "⛵️", "🚤", "⛲️",
                  "🚉", "🚖", "🏍", "🦼", "🛴",
                  "🛻"]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model = createMemoryGame()

    var cards: Array<Card> {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }

    func getScore() -> Int {
        model.score
    }
}
