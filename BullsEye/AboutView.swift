//
//  AboutView.swift
//  BullsEye
//
//  Created by Austin Roach on 10/11/20.
//

import SwiftUI
struct AboutView: View {
    let wenderlichSkin = Color(red: 255.0 / 255.0, green: 214.0 / 255.0 , blue: 179.0 / 255.0)
    var body: some View {
        Group{
            VStack {
                VStack{
                Text("🎯 Bullseye 🎯").modifier(AboutViewLargeTextStyle())
                }
                VStack{
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutViewSmallTextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutViewSmallTextStyle())
                Text("Enjoy!").modifier(AboutViewSmallTextStyle())

                }
            } .navigationBarTitle("About Bullseye")
            .background(wenderlichSkin)
           
        }.background(Image("Background"))
       
    }
    struct AboutViewTextColor: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
    }
    }
    struct AboutViewLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .modifier(AboutViewTextColor())
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    struct AboutViewSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .modifier(AboutViewTextColor())
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView().previewLayout(.fixed(width: 896.0, height: 414))
            }
    }
}

}
