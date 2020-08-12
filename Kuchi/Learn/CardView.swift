//
//  CardView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 12/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let flashCard: FlashCard
    @State var revealed = false
    
    init(_ card: FlashCard) {
        self.flashCard = card
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 320, height: 210)
                .cornerRadius(12)
            VStack {
                Spacer()
                Text(flashCard.card.question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                if self.revealed {
                    Text(flashCard.card.answer)
                    .font(.caption)
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .shadow(radius: 8)
        .frame(width: 320, height: 210)
        .animation(.spring())
        .gesture(TapGesture()
            .onEnded {
                withAnimation(.easeIn, {
                    self.revealed = !self.revealed
                })
        })
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = FlashCard(card: Challenge(
            question: "Apple",
            pronunciation: "Apple",
            answer: "Omena"
            )
        )
        return CardView(card)
    }
}
