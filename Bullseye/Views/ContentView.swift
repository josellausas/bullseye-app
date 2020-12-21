//
//  ContentView.swift
//  Bullseye
//
//  Created by Jose Llausas on 12/12/20.
//

import SwiftUI

//: MARK: - ContentView
struct ContentView: View {
    
    // TODO: Refactor this with Game()
    @State var isAlertVisible: Bool = false
    @State var sliderValue: Float = 1.0
    @State var targetValue: Float = Float.random(in: 1...100)
    @State private var game: Game = Game()
    
    //: -------------
    //: MARK: - Views
    
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
                    let roundedValue = Int((self.sliderValue * 100.00).rounded())
                    let roundedTarget = Int(self.targetValue.rounded())
                    let diff = abs(roundedValue - roundedTarget)
                    let points = 100 - diff
                    return showAlert(
                        title: "Hello there!",
                        message:
                            "The slide value is :\(roundedValue).\n" +
                            "You scored \(self.game.points(sliderValue: roundedValue)) this round.",
                        dismissMessage: "Awesome"
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
            Text("\(game.score)")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            s()
            Text("Round: ")
                .kerning(-1.0)
                .font(.title)
                .fontWeight(.black)
            Text("\(game.round)")
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
    
    //:----------------
    //: MARK: - body
    
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
    
    //:----------------
    //: MARK: - Actions
    
    /**
        Shows an alert message
     
        - Parameters:
     
            - title: The alert's title
     
            - message: The alert's message
     
            - dismissMessage:The alert's dismiss message
        
        - Returns: An `Alert` View
     
     */
    func showAlert(title: String, message: String, dismissMessage: String) -> Alert {
        return Alert(
            title: Text(title),
            message: Text(message),
            dismissButton: .default(
                Text(dismissMessage)
            )
        )
    }
}

//: MARK: - Previews

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
