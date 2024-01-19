//
//  ContentView.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    var loot = ["Epée", "Bouclier", "Armure"]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
