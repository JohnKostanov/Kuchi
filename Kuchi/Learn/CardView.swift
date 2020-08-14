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
    @State var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    
    typealias CardDrag = (_ card: FlashCard, _ direction: DiscardedDirection) -> Void
    let dragged: CardDrag
    
    init(_ card: FlashCard, onDrag dragged: @escaping CardDrag = {_,_ in }) {
        self.flashCard = card
        self.dragged = dragged
    }
    
    var body: some View {
        
        
        let drag = DragGesture()
          // 1
          .onChanged { self.offset = $0.translation }
          // 2
          .onEnded {
            if $0.translation.width < -100 {
              self.offset = .init(width: -1000, height: 0)
              self.dragged(self.flashCard, .left)
            } else if $0.translation.width > 100 {
              self.offset = .init(width: 1000, height: 0)
              self.dragged(self.flashCard, .right)
            } else {
              self.offset = .zero
            }
          }
        
        let longPress = LongPressGesture()
        .updating($isLongPressed) { value, state, transition in
          state = value
        }
        .simultaneously(with: drag)

        return ZStack {
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
        .offset(self.offset)
        .gesture(longPress)
        .scaleEffect(isLongPressed ? 1.1 : 1)
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
