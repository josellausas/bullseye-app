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
  
  //: MARK: - Game Init
  func testGameSccoreStartsAtZero() throws {
    XCTAssertEqual(self.game.score, 0)
  }
  
  func testGameGeneratesRandomNumberEachRound() throws {
    let firstTarget: Int = game.target
    XCTAssertNotNil(firstTarget)
    let secondTarget: Int = game.getNewRandomTarget()
    XCTAssertNotEqual(firstTarget, secondTarget)
    
  }
  
  //: MARK: - Score
  func testPointsScoredAreAddedToScore() throws {
    XCTAssertEqual(0, game.score)
    let points = game.scorePoints(sliderValue: 50)
    XCTAssertEqual(game.score, points)
  }
  
  func testScoreIsKeptThroughNewRounds() throws {
    XCTAssertEqual(0, game.score)
    let points = game.scorePoints(sliderValue: 50)
    XCTAssertEqual(game.score, points)
    let points2 = game.scorePoints(sliderValue: 50)
    XCTAssertEqual(game.score, points + points2)
  }
  
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
    let initialRound = game.round
    XCTAssertEqual(score, game.score)
    
    game.startNewRound()
    XCTAssertTrue(game.score == score)
    XCTAssertEqual(game.round, initialRound + 1)
  }
  
  //: MARK: - Bonus Points
  func testBonusPoints() throws {
    // TODO: Write a test that checks for 100 bonus points if diff is 0, 50 if <= 2
  }
  
  //: MARK: - Leaderboard
  func testLeaderboard() throws {
    game.startNewRound()
    XCTAssertEqual(game.leaderboardEntries.count, 0)
    let _ = game.scorePoints(sliderValue: 20)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    
    let _ = game.scorePoints(sliderValue: 20)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
  }
}
