//
//  RegisterView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 04/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var keyboardHandler: KeyboardFollower
    @State var amount: Double = 0
    @State var quantity = 0.0
    
    init(keyboardHandler: KeyboardFollower) {
        self.keyboardHandler = keyboardHandler
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            WellcomeMessageView()
            TextField("Type your name...", text: $userManager.profile.name)
                .bordered()
            HStack {
                Spacer()
                Text("\(userManager.profile.name.count)")
                    .font(.caption)
                    .foregroundColor(userManager.isUserNameValid() ? .green : .red)
                    .padding()
            }
            .padding(.bottom)
            HStack {
                Spacer()
                Toggle(isOn: $userManager.settings.rememberUser) {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .fixedSize()
            }
            Button(action: self.registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("ОК")
                        .font(.body)
                        .bold()
                }
            }
            .bordered()
            .disabled(!userManager.isUserNameValid())
            
            VStack {
                HStack {
                    Text("0")
                    Slider(value: $amount, in: 0.0 ... 10.0, step: 0.5)
                    Text("10")
                }
                Text("\(amount)")
            }
            
            Stepper("Quantity: \(quantity)", value: $quantity, in: 0 ... 10, step: 0.5)
            
            Spacer()
        }
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardHandler.isVisible ? .bottom: [])
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
    static let user = UserManager(name: "John")
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
            .environmentObject(user)
    }
}

// MARK: - Event Handlers
extension RegisterView {
    func registerUser() {
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }
        
        userManager.persistSettings()
//        userManager.isRegistered //???
    }
}
