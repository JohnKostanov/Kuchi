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
        ZStack {
            WelcomeBackgroundImage()
            WellcomeMessageView()
        }
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}


