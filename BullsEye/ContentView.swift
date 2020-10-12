//
//  ContentView.swift
//  BullsEye
//
//  Created by Austin Roach on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in:1...100)
    @State var score: Int = 0
    @State var rounds: Int = 1
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0 , blue: 102.0 / 255.0)
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .shadow(color : Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
                .modifier(ShadowStyle())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
    
        }
        
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.yellow)
                .modifier(ShadowStyle())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
    
        }
    
    }
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
    
        }
    
    }
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
    
        }
    
    }
    
        var body: some View {
        VStack {
            // Target Row
            Spacer()
            HStack {
                
                
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
                    }
            Spacer()
            
            //Slider Row
            
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1 ... 100)
                Text("100").modifier(LabelStyle())
                
            }
            
            //Button Row
            
            Spacer()
            Button(action: {
                print("Knock Knock")
                self.alertIsVisible = true
            }) {
                Text("Hit Me").modifier(ButtonLargeTextStyle())
            }
            .background(Image("Button")).modifier((ShadowStyle()))

            Spacer()
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                return Alert(title: Text("\(reaction())"), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round." ), dismissButton: .default(Text("Try again"))
                        {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1 ... 100)
                        self.rounds = self.rounds + 1
                                
                                        
                        }
                )
            }
            .background(Image("Button")).modifier((ShadowStyle()))
                .accentColor(midnightBlue)
            // Score Row
            HStack {
                HStack{
                    Button(action: {
                        resetGame()
                    }){
                        HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier((ShadowStyle()))

                    Spacer()
                    Text("Score").modifier(LabelStyle())
                    Text("\(score)").modifier(ValueStyle())
                    Spacer()
                    Text("Round").modifier(LabelStyle())
                    Text("\(rounds)").modifier(ValueStyle())
                    Spacer()
                    Button(action: {
                            print("ok")
                        
                    }){
                        
                    
                        HStack {
                            Image("InfoIcon")
                        Text("info").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier((ShadowStyle()))

                    .padding(.bottom, 20)
                }
               
            }
            
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    func difference() -> Int {
        abs(target-sliderValueRounded())
    }
    func preBonusScore() -> Int {
        100 - difference()
    }
    func pointsForCurrentRound() -> Int{
        if preBonusScore() == 100 {
          return  preBonusScore() + 100
        }
        if preBonusScore() == 99 {
            return preBonusScore() + 50
        }
        else {
           return preBonusScore()
        }
    }
        func reaction() -> String {
            let difference = abs(self.target - sliderValueRounded())
            var title: String = "Hello"
            if difference == 0 {
                title = "Perfect!"
            } else if difference < 5{
               title =  "You almost had it!"
            } else if difference >= 10{
               title = "Not Bad"
            } else if difference >= 20 {
               title = "You're stupid! Quit now!!"
            }
            return title
        }
    func resetGame() {
        score = 0
        rounds = 0
        sliderValue = 50
    }
    }
    

struct ContentView_Previews:
    PreviewProvider {
        static var previews: some View {
            Group {
                ContentView().previewLayout(.fixed(width: 896.0, height: 414))
                }
        }
    
    }

