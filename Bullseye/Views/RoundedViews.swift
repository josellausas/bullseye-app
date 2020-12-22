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
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoudedImageViewStroked(systemName: "arrow.counterclockwise")
      RoudedImageViewStroked(systemName: "list.dash")
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
