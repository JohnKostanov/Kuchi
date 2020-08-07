//
//  ScoreView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 07/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    let numberOfQuestions: Int
    
    @State var numberOfAnswered = 0 //State<Int>(initialValue: 0)
    
    var body: some View {
//        Button(action: {
//            self.numberOfAnswered += 1
//            print("Answered: \(self.numberOfAnswered)")
//        }) {
//            ...
//        }
        
        HStack {
            Text("\(numberOfAnswered)/\(numberOfQuestions)")
                .font(.caption)
                .padding(4)
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(numberOfQuestions: 5)
    }
}
