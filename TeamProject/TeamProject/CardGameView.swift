//
//  CardGameView.swift
//  TeamProject
//
//  Created by 이현호 on 11/9/23.
//

import SwiftUI

struct CardGameView: View {
    @ObservedObject var viewModel = CardGameViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .padding(10)
                
                // start 버튼
                Button {
                    viewModel.showAllCards()
                    
                    // 2초 후에 카드를 다시 뒤집기
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        viewModel.hideAllCards()
                    }
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
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("축하합니다"), message: Text("모든 카드를 다 맞추셨습니다!"), dismissButton: .default(Text("다시하기")))
            }
            .padding()
            .navigationBarTitle("카드게임")
        }
    }
}

#Preview {
    CardGameView()
}
