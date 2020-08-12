//
//  DeckView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 12/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    var body: some View {
        ZStack {
            CardView()
            CardView()
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
