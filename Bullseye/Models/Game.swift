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
  var target: Int = Int.random(in: 1...100)
  
  /// The player's score
  var score:  Int = 0
  
  /// The current round
  var round:  Int = 1
  
  /**
   
   Calculates how many points the user gets for his attempt
   
   - Parameters:
   - sliderValue:  The users value
   
   - Returns:
   The number of points
   
   */
  func points(sliderValue: Int) -> Int {
    return 100 - abs(sliderValue - self.target)
  }
}
