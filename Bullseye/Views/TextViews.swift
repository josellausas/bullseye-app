//
//  TextViews.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/20/20.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.title3)
  }
}

struct TitleTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title)
      .fontWeight(.black)
      .kerning(2.0)
      .foregroundColor(Color.green)
      .padding()
  }
}

struct GameMenuView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      Button(action:{}) {
        Text("Start Over")
          .kerning(-1.0)
          .font(.title)
          .fontWeight(.black)
      }
      Spacer()
      Text("Score: ")
        .kerning(-1.0)
        .font(.title)
        .fontWeight(.black)
      Text("\(game.score)")
        .kerning(-1.0)
        .font(.title)
        .fontWeight(.black)
      Spacer()
      Text("Round: ")
        .kerning(-1.0)
        .font(.title)
        .fontWeight(.black)
      Text("\(game.round)")
        .kerning(-1.0)
        .font(.title)
        .fontWeight(.black)
      Spacer()
      Button(action:{}){
        Text("Info")
          .kerning(-1.0)
          .font(.title)
          .fontWeight(.black)
      }
    }.padding(.bottom, 20)
  }
}

struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color.white)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.accentColor)
  }
}

struct BigNumberText: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
}

struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TitleTextView(text: "🎯 BULLSEYE APP")
      InstructionText(text: "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO:")
      BodyText(text: "You scored 200 Points!\n🎉🎉🎉")
      BigNumberText(text: "89")
      ButtonText(text: "Start New Round")
    }
    .padding()
  }
}

