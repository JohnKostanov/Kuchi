//
//  WellcomeMessageView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 04/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct WellcomeMessageView: View {
    var body: some View {
        HStack {
            LogoImage()
            
            VStack {
                Text("Welcome to")
                    .font(.headline)
                    .bold()
                
                Text("Kuchi")
                    .font(.largeTitle)
                    .bold()
                
            }
            .foregroundColor(.red)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            //                          .background(Color.gren)
        }
    }
}

struct WellcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeMessageView()
    }
}
