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
        userManager.persistProfile()
    }
}
