//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Igor Terletskyi on 18.06.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var viewModel = MemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: viewModel)
        }
    }
}
