//
//  LearnView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 09/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var learningStore =
        LearningStore(deck: ChallengesViewModel().challenges)
    
    var body: some View {
        VStack {
            Spacer()
            Text("Swipe left if you remembered"
                + "\nSwipe right if you didn’t")
                .font(.headline)
            DeckView()
            Spacer()
            Text("Remembered \(self.learningStore.score)"
                + "/\(self.learningStore.deck.cards.count)")
            
        }
        
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
