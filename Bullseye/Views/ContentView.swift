//
//  ContentView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/12/20.
//

import SwiftUI

//: MARK: - ContentView
struct ContentView: View {
  
  // TODO: Refactor this with Game()
  @State var isAlertVisible = false
  @State var sliderValue = 1.0
  @State var targetValue = Float.random(in: 1...100)
  @State private var game = Game()
  
  //: -------------
  //: MARK: - Views
  
  func buttonAction() -> Void {
    self.isAlertVisible = true
  }
  
  func targetValueTextView(_ targetValue: String) -> some View {
    return Text(targetValue)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
  
  func sliderWidget(_ value: Binding<Double>) -> some View {
    return HStack {
      Text("1")
      Slider(value: value)
      Text("100")
    }
  }
  
  /**
      Hit me action
   
      - Returns: some `View`
   */
  func hitMeButton() -> some View {
    return Button(action: self.buttonAction) {
      Text("Hit Me!".uppercased())
        .kerning(-1.0)
        .font(.title3)
        .fontWeight(.black)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(
            colors: [Color.white.opacity(0.3), Color.clear]),
            startPoint: .top,
            endPoint: .bottom
          )
      }
    )
    .foregroundColor(.white)
    .cornerRadius(21)
    
    .alert(
      isPresented: $isAlertVisible,
      content:{
        let roundedValue = Int((self.sliderValue * 100.00).rounded())
        return showAlert(
          title: "Hello there!",
          message:
            "The slide value is :\(roundedValue).\n" +
            "You scored \(self.game.points(sliderValue: roundedValue)) this round.",
          dismissMessage: "Awesome"
        )
        
      }
    )
  }
  
  func gameMenu() -> some View {
    GameMenuView(game: $game)
  }
  
  //:----------------
  //: MARK: - body
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack {
        TitleTextView(text: "🎯 BULLSEYE APP")
        VStack {
          InstructionText(text: "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO:")
          targetValueTextView("\(self.game.target)")
        }.padding()
        sliderWidget($sliderValue).padding()
        hitMeButton()
        gameMenu()
      }
    }
  }
  
  //:----------------
  //: MARK: - Actions
  
  /**
   Shows an alert message
   
   - Parameters:
      - title: The alert's title
      - message: The alert's message
      - dismissMessage:The alert's dismiss message
   
   - Returns: An `Alert` View
   
   */
  func showAlert(title: String, message: String, dismissMessage: String) -> Alert {
    return Alert(
      title: Text(title),
      message: Text(message),
      dismissButton: .default(
        Text(dismissMessage)
      )
    )
  }
}

//: MARK: - Previews

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .preferredColorScheme(.light)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    ContentView()
      .preferredColorScheme(.light)
  }
}
