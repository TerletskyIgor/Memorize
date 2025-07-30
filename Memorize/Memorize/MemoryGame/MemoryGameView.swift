//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Igor Terletskyi on 18.06.2025.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack {
            cards.foregroundColor(viewModel.color)
            HStack {
                newGame
                Spacer()
                deck.foregroundColor(viewModel.color)
                Spacer()
                score
                Spacer()
                shuffle
            }
        }
        .padding()
    }
    
    var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    var newGame: some View {
        Button("New Game") {
            viewModel.startNewGame()
        }
    }
    
    @State var lastScoreChange = (0, causedByCardId: "")
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: Constant.aspectRatio) { card in
            if isDealt(card) {
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .padding(Constant.spacing)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0 )
                    .onTapGesture {
                        choose(card)
                    }
            }
        }
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @Namespace private var dealingNamespace

    private var deck: some View {
        ZStack {
            ForEach(undealtCards) {
                CardView($0)
                    .matchedGeometryEffect(id: $0.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
        .frame(width: Constant.deckWidth, height: Constant.deckWidth / Constant.aspectRatio)
        .onTapGesture {
           deal()
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 1
        for card in viewModel.cards {
            _ = withAnimation(Constant.dealAnimation.delay(delay)){
                dealt.insert(card.id)
            }
            delay += Constant.dealInterval
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation(.easeInOut(duration: 1)) {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, card.id)
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, causedByCardId: id)  = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    struct Constant {
        static let aspectRatio: CGFloat = 2 / 3
        static let spacing: CGFloat = 4
        static let deckWidth: CGFloat = 100
        static let dealInterval: TimeInterval = 0.1
        static let dealAnimation: Animation = .easeInOut(duration: 1)
    }
}

#Preview {
    MemoryGameView(viewModel: MemoryGameViewModel())
}

