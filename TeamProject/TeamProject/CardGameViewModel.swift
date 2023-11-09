//
//  CardGameViewModel.swift
//  TeamProject
//
//  Created by 최동호 on 11/9/23.
//

import Foundation
import SwiftUI

class CardGameViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var selectedCards: [Card] = []
    @Published var showAlert = false
    
    init() {
        newGame()
    }
    
    func choose(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            selectedCards.append(cards[index])
            
            cards[index].isAnimating = true
            
            withAnimation(.easeInOut(duration: 0.5)) {
                cards[index].isFaceUp.toggle()
            }
            
            if selectedCards.count == 2 {
                if selectedCards[0].value == selectedCards[1].value {
                    selectedCards.removeAll()
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        for selectedCard in self.selectedCards {
                            if let selectedIndex = self.cards.firstIndex(where: { $0.id == selectedCard.id }) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.cards[selectedIndex].isFaceUp.toggle()
                                }
                                self.cards[selectedIndex].isAnimating = false
                            }
                        }
                        self.selectedCards.removeAll()
                    }
                }
            }
            
            if checkAllCardsMatched() {
                showAlert = true
            }
        }
    }
    
    func showAllCards() {
        for index in cards.indices {
            withAnimation(.easeInOut(duration: 0.5)) {
                cards[index].isFaceUp = true
            }
        }
    }
    
    func hideAllCards() {
        for index in cards.indices {
            withAnimation(.easeInOut(duration: 0.5)) {
                cards[index].isFaceUp = false
            }
        }
    }
    
    func checkAllCardsMatched() -> Bool {
        return !cards.contains { !$0.isFaceUp }
    }
    
    func newGame() {
        
        let fruitEmojis = ["🍒", "🍏", "🍊", "🍇", "🍓", "🍉", "🍍", "🥭"]
        var emojiPairs = (fruitEmojis + fruitEmojis).shuffled()
        
        cards = (0..<16).map { id in
            Card(id: id, value: emojiPairs.removeFirst())
        }
        
        selectedCards.removeAll()
    }
}
