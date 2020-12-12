//
//  ContentView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/12/20.
//

import SwiftUI

/// Main View
struct ContentView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Bullseye App")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
                .padding()
            Button(action: {
                print("Pressed!")
                self.showAlert = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: $showAlert) {
                () -> Alert in
                return Alert(title: Text("Hello there"), message: Text("First pop up!"), dismissButton: .default(Text("Awsome")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
