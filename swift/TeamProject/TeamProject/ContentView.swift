//
//  ContentView.swift
//  TeamProject
//
//  Created by 이현호 on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            Text("\(selection)")
            
            TabView(selection: $selection) {
                CardGameView()

            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
