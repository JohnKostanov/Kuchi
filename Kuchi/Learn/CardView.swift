//
//  CardView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 12/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
          Rectangle()
            .fill(Color.red)
            .frame(width: 320, height: 210)
            .cornerRadius(12)
          VStack {
            Spacer()
            Text("Apple")
              .font(.largeTitle)
              .foregroundColor(.white)
            Text("Omena")
              .font(.caption)
              .foregroundColor(.white)
            Spacer()
          }
        }
          .shadow(radius: 8)
          .frame(width: 320, height: 210)
          .animation(.spring())

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
