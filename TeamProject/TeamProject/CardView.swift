//
//  CardView.swift
//  TeamProject
//
//  Created by 이현호 on 11/9/23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack {
            Text(card.isFaceUp ? card.value : "?")
                .frame(minWidth: 70, minHeight: 100, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(Color.cyan)
                .cornerRadius(5)
                .font(.largeTitle)
        }
        .rotation3DEffect(
            .degrees(card.isFaceUp ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
