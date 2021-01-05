//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/30/20.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    VStack {
      HeaderView()
      LabelView()
      RowView(index: 1, score: 100, date:Date())
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          ScreenTitleText(text: "LeaderBoard")
            .padding(.leading)
          Spacer()
        } else {
          ScreenTitleText(text: "LeaderBoard")
        }
      }
      
      HStack {
        Spacer()
        Button(action: {}) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
        
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.dateColWidth)
    }.background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(
          Color("LeaderboardRowColor"),
          lineWidth: Constants.General.strokeWidth
        )
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      Text("Score").bold()
        .frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      Text("Date")
        .frame(width: Constants.Leaderboard.dateColWidth)
    }
      .padding(.leading)
      .padding(.trailing)
      .padding(.bottom)
      .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView()
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    LeaderboardView()
      .preferredColorScheme(.dark)
    LeaderboardView()
      .preferredColorScheme(.light)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    LeaderboardView()
      .preferredColorScheme(.light)
  }
}
