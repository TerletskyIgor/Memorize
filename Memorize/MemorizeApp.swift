//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ihor Terletskyi on 20.03.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
