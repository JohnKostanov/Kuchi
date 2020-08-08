//
//  WellcomeView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 01/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct WellcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    @State var showPractice = false

    @ViewBuilder var body: some View {
      if showPractice {
        // 2
        PracticeView(
          challengeTest: $challengesViewModel.currentChallenge,
          userName: $userManager.profile.name,
          numberOfAnswerd: .constant(challengesViewModel.numberOfAnswered)
        )
      } else {
        // 3
        ZStack {
          WelcomeBackgroundImage()

          VStack {
            Text(verbatim: "Hi, \(userManager.profile.name)")

            WellcomeMessageView()

            // 4
            Button(action: {
              self.showPractice = true
            }, label: {
              HStack {
                Image(systemName: "play")
                Text(verbatim: "Start")
              }
            })
          }
        }
      }
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView().environmentObject(UserManager())
    }
}


