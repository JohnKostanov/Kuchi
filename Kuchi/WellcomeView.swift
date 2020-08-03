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
            Image("swiftlogo", bundle: nil)
                .resizable()
//                .scaledToFit()
                .aspectRatio(2/1, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.8)
            HStack {
                Image(systemName: "table")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//                          .cornerRadius(30/2)
                            .background(Color(white: 0.9))
                            .clipShape(Circle())
                            .foregroundColor(.red)
                            
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
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
