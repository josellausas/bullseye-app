//
//  Game.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/19/20.
//

import Foundation

/// The Game Model
struct Game {
  
  /// Randomly generates a number from 1 to 100
  var target: Int
  
  /// The player's score
  var score: Int
  
  /// The current round
  var round: Int
  
  
  /// Inits a new Game
  init() {
    target = Int.random(in: 1...100)
    score = 0
    round = 1
  }
  
  
  /// Returns a random number between 1 and 100
  func getNewRandomTarget() -> Int {
    return Int.random(in: 1...100)
  }
  
  
  /// Starts a new round and resets score
  public mutating func startNewRound() {
    self.target = getNewRandomTarget()
    self.round += 1
  }
  
  
  /**
   Calculates how many points the user gets for his attempt
   
   - Parameters:
      - sliderValue:  The users value
   
   - Returns:
      The number of points
   */
  mutating func scorePoints(sliderValue: Int) -> Int {
    let scored = 100 - abs(sliderValue - self.target)
    self.score += scored
    return scored
  }
}
