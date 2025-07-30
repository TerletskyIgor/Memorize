//
//  Theme.swift
//  Memorize
//
//  Created by Igor Terletskyi on 20.06.2025.
//

import Foundation


// TODO: - Add color for each theme
enum Theme: String {
    case halloween
    case car
    case animal
    case fruit
    case vegetables
    case fastfood
    
    var value: [String] {
        switch self {
        case .animal: return ["🐈", "🐩", "🐿️", "🦔", "🐄", "🦬" ,"🫏", "🦝", "🦆"]
        case .car: return ["🚗", "🚙", "🏎️", "🚕", "🚓", "🚘", "🚖", "🚖", "🚔"]
        case .halloween: return ["💀", "🎃", "👻", "🕷️", "👽", "👾", "🕯️", "👿", "🧟‍♂️",]
        case .fruit: return ["🍏", "🍐", "🍇", "🍍", "🫐", "🍌", "🍉", "🍒", "🍑"]
        case .vegetables: return ["🍆", "🫛", "🥦", "🥬", "🥒", "🌶️", "🥕", "🍅", "🥔", " "]
        case .fastfood: return ["🍔", "🌭", "🍟", "🍕", "🫓", "🌮", "🌯", "🫓", "🫔"]
        }
    }
    
    var maxPairsCount: Int {
        self.value.count
    }
    
    var description: String {
        switch self {
        case .animal: return "This topic will contain animals"
        case .car: return "This topic will contain cars"
        case .halloween: return "This topic will contain Halloween symbols"
        case .fruit: return "This topic will contain fruits"
        case .vegetables: return "This topic will contain vegetables"
        case .fastfood: return "This topic will contain fast food"
        }
    }
    
    var imageName: String {
        switch self {
        case .animal: return "hare"
        case .car: return "car.rear"
        case .halloween: return "moon.stars"
        case .fruit: return "apple"
        case .vegetables: return "carrot"
        case .fastfood: return "pizza"
        }
    }
}
