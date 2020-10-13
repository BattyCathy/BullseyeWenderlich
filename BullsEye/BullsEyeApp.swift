//
//  BullsEyeApp.swift
//  BullsEye
//
//  Created by Austin Roach on 10/10/20.
//

import SwiftUI
@main
struct BullsEyeApp: App {
    var body: some Scene {
        
        let contentView = NavigationView {
            ContentView()
            AboutView()
        }
        WindowGroup {
            contentView
            
            
        }
    }
}


struct BullsEyeApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
