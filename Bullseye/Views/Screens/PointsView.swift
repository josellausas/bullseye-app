//
//  PointsView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/30/20.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: Int
  @Binding var game: Game
  @Binding var score: Int
  
  
  
  var body: some View {
    
    // TODO: Fix this
    
    VStack(spacing: 10) {
      InstructionText(text: "Slider's value is")
      BigNumberText(text: "\(sliderValue)")
      BodyText(text: "You scored \(score) Points!\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          isAlertVisible = false
        }
        game.startNewRound()
      }){
        ButtonText(text: "Start New Round")
      }
    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(21.0)
      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
      .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {
  
  static private var isAlertVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50)
  static private var game = Binding.constant(Game())
  static private var score = Binding.constant(100)
  
  static var previews: some View {
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game, score: score)
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game, score: score)
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game, score: score)
      .preferredColorScheme(.light)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game, score: score)
      .preferredColorScheme(.light)
  }
}
