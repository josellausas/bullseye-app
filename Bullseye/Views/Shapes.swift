//
//  Shapes.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/22/20.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
      VStack {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20.0, antialiased: true)
          .frame(width: 200, height: 100, alignment: .center)
          
      }.background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
