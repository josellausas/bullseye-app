//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/30/20.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    RowView(index: 1, score: 100, date:Date())
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: "\(index)")
      ScoreText(score: score)
        .frame(minWidth: Constants.Leaderboard.scoreColWidth)
      DateText(date: date)
        .frame(minWidth: Constants.Leaderboard.dateColWidth)
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
