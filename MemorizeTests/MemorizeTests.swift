//
//  MemorizeTests.swift
//  MemorizeTests
//
//  Created by Ihor Terletskyi on 20.06.2022.
//

import XCTest
@testable import Memorize

class MemorizeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOneAndOnly() {
        let array = [1, 2, 3]
        let result = array.oneAndOnly
        XCTAssertEqual(nil, result)
    }
    
    func testOneAndOnlyEmptyArray() {
        let array = [Int]()
        let result = array.oneAndOnly
        XCTAssertEqual(nil, result)
    }
    
    func testOneAndOnlyWithValue() {
        let array = [1]
        let result = array.oneAndOnly
        XCTAssertEqual(1, result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testMemoryGame() {
//        var emojis = ["🚌",  "🏎"]
//        let memoryGame = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
//            emojis[pairIndex]
//        }
//
//        memoryGame.cards.
//    }
}
