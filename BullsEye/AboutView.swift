//
//  AboutView.swift
//  BullsEye
//
//  Created by Austin Roach on 10/11/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            VStack{
            Text("🎯 Bullseye 🎯").modifier(AboutViewLargeTextStyle())
                .padding(.vertical, 20)
            }
            VStack{
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutViewSmallTextStyle())
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutViewSmallTextStyle())
            Text("Enjoy!").modifier(AboutViewSmallTextStyle())
                .padding(.horizontal, 60.0)
                .padding(.bottom, 20)
                
            }
            
        }
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
    
        }
    }
    struct AboutViewSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .modifier(AboutViewTextColor())
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
    
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
