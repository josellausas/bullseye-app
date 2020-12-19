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
    @State var isAlertVisible: Bool = false
    @State var sliderValue: Float = 50.0
    @State var targetValue: Float = Float.random(in: 1...100)
    
    func buttonAction() -> Void {
        self.isAlertVisible = true
    }
    
    func s() -> some View {
        return Spacer()
    }
    
    func titleTextView(_ text: String) -> some View {
        return Text(text)
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color.green)
            .padding()
    }
    
    func instructionTextView(_ text: String) -> some View {
        return Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.title3)
    }
    
    func targetValueTextView() -> some View {
        return Text("\(self.targetValue)")
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
    
    func sliderWidget() -> some View {
        return HStack {
            Text("1")
            Slider(value: $sliderValue)
            Text("100")
        }
    }
    
    func showAlert(title: String, message: String) -> Alert {
        return Alert(
            title: Text(title),
            message: Text(message),
            dismissButton: .default(
                Text("OK")
            )
        )
    }
    
    func hitMeButton() -> some View {
        return Button(action: self.buttonAction) {
            Text("Hit Me!")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
        }
            .padding()
            .alert(
                isPresented: $isAlertVisible,
                content:{
                    showAlert(
                        title: "Title",
                        message: "Slider value: \(self.sliderValue)"
                    )
                    
                }
        )
    }
    
    func gameMenu() -> some View {
        return HStack {
            Button(action:{}) {
                Text("Start Over")
                    .kerning(-1.0)
                    .font(.title)
                    .fontWeight(.black)
            }
            s()
            Text("Score: ")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            Text("999999")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            s()
            Text("Round: ")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            Text("999")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            s()
            Button(action:{}){
                Text("Info")
                    .kerning(-1.0)
                    .font(.title)
                    .fontWeight(.black)
            }
        }.padding(.bottom, 20)
    }
    
    var body: some View {
        VStack {
            titleTextView("🎯 BULLSEYE APP")
            VStack {
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
