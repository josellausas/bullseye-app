//
//  PointsView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/30/20.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedSlider = Int(sliderValue.rounded())
    let score: Int = game.scorePoints(sliderValue: roundedSlider)
    
    VStack(spacing: 10) {
      InstructionText(text: "Slider's value is")
      BigNumberText(text: "\(roundedSlider)")
      BodyText(text: "You scored \(score) Points!\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          isAlertVisible = false
        }
        game.resetRound()
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
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  
  static var previews: some View {
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.light)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.light)
  }
}
