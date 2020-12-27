//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Jose Llausas on 12/12/20.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
  
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() throws {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() throws {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound() throws {
    let score = game.points(sliderValue: 10)
    XCTAssertTrue(score == game.score)
    game.resetRound()
    XCTAssertTrue(game.score == 0)
  }
}
