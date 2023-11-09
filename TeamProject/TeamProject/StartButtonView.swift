//
//  StartButtonView.swift
//  TeamProject
//
//  Created by 이현호 on 11/9/23.
//

import SwiftUI

struct StartButtonView: View {
    @ObservedObject var viewModel: CardGameViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.showAllCards()
                
            } label: {
                Text("START")
                    .font(.title)
                    .frame(width: 150, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding()
                    .foregroundColor(.black)
            }
        }
        
    }
    

    func startGame() {
        viewModel.newGame()
    }
}

#Preview {
    StartButtonView(viewModel: CardGameViewModel())
}
