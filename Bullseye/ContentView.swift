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
    
    func titleTextView(_ text: String) -> some View {
        return Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.green)
            .padding()
    }
    
    func instructionTextView(_ text: String) -> some View {
        return Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.subheadline)
    }
    
    func targetValueTextView() -> some View {
        return Text("\(self.targetValue)")
            .fontWeight(.heavy)
    }
    
    func sliderWidget() -> some View {
        return HStack {
            Text("1")
            Slider(value: $sliderValue)
            Text("100")
        }
    }
    
    func hitMeButton() -> some View {
        return Button(action: self.buttonAction) {
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
    }
    
    func gameMenu() -> some View {
        return HStack {
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
    
    var body: some View {
        VStack {
            titleTextView("🎯 Bullseye App")
            HStack {
                instructionTextView("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO:")
                targetValueTextView()
            }.padding()
            sliderWidget()
            hitMeButton()
            gameMenu()
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
