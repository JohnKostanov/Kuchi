//
//  FlashCard.swift
//  Kuchi
//
//  Created by  Джон Костанов on 09/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct FlashCard: Identifiable {
    var card: Challenge
    let id = UUID()
    var isActive = true
    
}

extension FlashCard: Equatable {
  static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
    return lhs.card.question == rhs.card.question
        && lhs.card.answer == rhs.card.answer
  }
}

