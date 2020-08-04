//
//  RegisterView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 04/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            
            WellcomeMessageView()
            TextField("Type your name...", text: $name)
            
            Spacer()
        }
        .background(WelcomeBackgroundImage())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
