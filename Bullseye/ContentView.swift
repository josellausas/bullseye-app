//
//  ContentView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/12/20.
//

import SwiftUI

class HeyThere {
    var message: String

    init(_ msg: String) {
        message = msg
    }
    
    func salute(_ name: String){
        print("Hi \(name), \(self.message)")
    }
}

/// Main View
struct ContentView: View {
    
    //: Use `@State` to indicate that this should refresh the view when modified
    @State var showAlert: Bool = false
    @State var sliderValue: Float = 50.0
    @State var targetValue: Float = Float.random(in: 1...100)
    
    func buttonAction() -> Void {
        self.showAlert = true
    }
    
    func s() -> some View {
        return Spacer()
    }
    
    var body: some View {
        VStack {
            Text("🎯 Bullseye App")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
                .padding()
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .fontWeight(.ultraLight)
                Text("\(self.targetValue)")
                    .fontWeight(.heavy)
            }.padding()
            
            HStack {
                Text("1")
                Slider(value: $sliderValue)
                Text("100")
            }
            
            Button(action: self.buttonAction) {
                Text("Hit Me!")
            }
                .padding()
                .alert(isPresented: $showAlert) {
                    () -> Alert in
                        return Alert(
                            title: Text("Hello there"),
                            message: Text("The slider value is \(self.sliderValue)"),
                            dismissButton: .default(Text("Awsome"))
                        )
                }
            HStack {
                Button(action:{}) {
                    Text("Start Over")
                }
                s()
                Text("Score: ")
                Text("999999")
                s()
                Text("Round: ")
                Text("999")
                s()
                Button(action:{}){
                    Text("Info")
                }
            }.padding(.bottom, 20)
            
        }
    }
    func getPointsForCurrentRound() -> Int {
        return abs(Int(self.targetValue) - Int(self.sliderValue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(
                .fixed(
                    width: 896,
                    height: 414
                )
            )
    }
}
