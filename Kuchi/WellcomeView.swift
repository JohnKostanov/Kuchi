//
//  WellcomeView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 01/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct WellcomeView: View {
    var body: some View {
        Text("Welcome to Kuchi")
            .font(.system(size: 50))
            .bold()
            .foregroundColor(.green)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding()
            .background(Color.red)
            
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
