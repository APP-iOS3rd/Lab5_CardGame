//
//  Card.swift
//  TeamProject
//
//  Created by 최동호 on 11/9/23.
//

import Foundation

struct Card: Identifiable {
    let id: Int
    var isFaceUp = false
    var value: String
    var isAnimating = false
}
