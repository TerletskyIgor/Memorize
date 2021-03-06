//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ihor Terletskyi on 20.03.2022.
//

import SwiftUI


struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        VStack {
            Text("Score: \(game.getScore())")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2 / 3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
}

struct CardView: View {
    private let card: EmojiMemoryGame.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }

    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width,
                              size.height)
                    * DrawingConstants.fontScale)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
