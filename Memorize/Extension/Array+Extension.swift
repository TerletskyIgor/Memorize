//
//  Array+Extension.swift
//  Memorize
//
//  Created by Ihor Terletskyi on 20.06.2022.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
