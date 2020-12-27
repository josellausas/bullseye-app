//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/22/20.
//

import SwiftUI

struct RoudedImageViewStroked: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonColor"))
      .frame(width: 56.0, height: 56.0, alignment: .center)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56.0, height: 56.0, alignment: .center)
      .background(
        Circle()
          .fill(Color("ButtonFilledColor"))
      )
      
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoudedImageViewStroked(systemName: "arrow.counterclockwise")
      RoudedImageViewStroked(systemName: "list.dash")
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
