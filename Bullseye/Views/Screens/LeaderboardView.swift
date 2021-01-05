//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/30/20.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    let sortedArray = game.leaderboardEntries.sorted {
      $0.score > $1.score
    }
    ZStack {
      Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        VStack(spacing: 10) {
          ForEach(sortedArray.indices) { i in
            let entry = sortedArray[i]
            RowView(index: i + 1, score: entry.score, date:entry.date)
          }
        }
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardIsShowing: Bool
  
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
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.light)
      .previewLayout(
        .fixed(
          width: 896,
          height: 414
        )
      )
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.light)
  }
}
