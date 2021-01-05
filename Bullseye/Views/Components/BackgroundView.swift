//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/22/20.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
        .padding()
        .background(
          Color("BackgroundColor")
            .edgesIgnoringSafeArea(.all)
        )
    }
  }
}

struct TopView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      HStack {
        RoudedImageViewStroked(systemName: "arrow.counterclockwise")
        Spacer()
        RoundedImageViewFilled(systemName: "list.dash")
      }
    }
  }
}

struct NumberView {
  var title: String
}


struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
    BackgroundView(game: .constant(Game())).preferredColorScheme(.dark)
  }
}
