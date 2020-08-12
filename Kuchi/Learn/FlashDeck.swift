//
//  FlashDeck.swift
//  Kuchi
//
//  Created by  Джон Костанов on 12/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import Foundation

class FlashDeck: ObservableObject {
    @Published var cards: [FlashCard]
    
    init(from words: [Challenge]) {
        self.cards = words.map {
            FlashCard(card: $0)
        }
    }
}
