//
//  Game.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/19/20.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

/// The Game Model
struct Game {
  
  /// Randomly generates a number from 1 to 100
  var target: Int
  
  /// The player's score
  var score: Int
  
  /// The current round
  var round: Int
  
  var leaderboardEntries: [LeaderboardEntry]
  
  
  /// Inits a new Game
  init(loadTestData: Bool = false) {
    target = Int.random(in: 1...100)
    score = 0
    round = 1
    
    leaderboardEntries = []
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 987, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 400, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 500, date: Date()))
    }
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
    
    // Add to scoreboard
    leaderboardEntries.append(
      LeaderboardEntry(score: scored, date: Date())
    )
    return scored
  }
}
