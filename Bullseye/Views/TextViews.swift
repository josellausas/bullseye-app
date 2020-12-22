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

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TitleTextView(text: "🎯 BULLSEYE APP")
      InstructionText(text: "PUT THE BULLSEYE AS CLOSE AS YOU CAN TO:")
    }
  }
}

