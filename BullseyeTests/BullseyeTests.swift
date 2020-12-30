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
  
  //: MARK: - Setup
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  //: MARK: - Score
  func testScorePositive() throws {
    let guess = game.target + 5
    let score = game.scorePoints(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() throws {
    let guess = game.target - 5
    let score = game.scorePoints(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScorePoints() throws {
    let score = game.scorePoints(sliderValue: 10)
    XCTAssertEqual(score, game.score)
  }
  
  func testNewRoundResetsScore() throws {
    let score = game.scorePoints(sliderValue: 10)
    XCTAssertEqual(score, game.score)
    game.resetRound()
    XCTAssertTrue(game.score == 0)
  }
  
  
  //: MARK: - Bonus Points
  func testBonusPoints() throws {
    // TODO: Write a test that checks for 100 bonus points if diff is 0, 50 if <= 2
  }
}
