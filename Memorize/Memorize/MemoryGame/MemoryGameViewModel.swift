//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Igor Terletskyi on 19.06.2025.
//

import SwiftUI

typealias Card = MemoryGameModel<String>.Card

class MemoryGameViewModel: ObservableObject {
    private static let emojis: Theme = .car
    var color: Color {
        .orange
    }
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel<String>(numberOfPairsOfCards: 10) {
            if emojis.value.indices.contains($0) {
                return emojis.value[$0]
            } else {
                return "⚠️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [Card]  {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func startNewGame() {
        model = Self.createMemoryGame()
    }
}
