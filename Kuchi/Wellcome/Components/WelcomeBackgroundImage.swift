//
//  WelcomeBackgroundImage.swift
//  Kuchi
//
//  Created by  Джон Костанов on 04/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("swiftlogo", bundle: nil)
                        .resizable()
//                        .scaledToFit()
            .aspectRatio(2/1, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .saturation(0.5)
                        .blur(radius: 5)
                        .opacity(0.8)
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
