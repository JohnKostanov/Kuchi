//
//  LogoImage.swift
//  Kuchi
//
//  Created by  Джон Костанов on 04/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image(systemName: "table")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        //                          .cornerRadius(30/2)
                                    .background(Color(white: 0.9))
                                    .clipShape(Circle())
                                    .foregroundColor(.red)
    }
}

struct LogoImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoImage()
    }
}
