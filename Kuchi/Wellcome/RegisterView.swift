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
                .bordered()
            
            Spacer()
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

//struct KuchiTextStyle: TextFieldStyle {
//    public func _body(
//        configuration: TextField<Self._Label>) -> some View {
//        return configuration
//
//    }
//
//}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
