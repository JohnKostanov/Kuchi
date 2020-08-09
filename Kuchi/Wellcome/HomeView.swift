//
//  HomeView.swift
//  Kuchi
//
//  Created by  Джон Костанов on 09/08/2020.
//  Copyright © 2020 John Kostanov. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    
    var body: some View {
        TabView {
            LearnView()
                .tabItem({
                    VStack {
                        Image(systemName: "bookmark")
                        Text("Learn")
                    }
                })
                .tag(0)
            PracticeView(
                challengeTest: $challengesViewModel.currentChallenge,
                userName: $userManager.profile.name,
                numberOfAnswerd: .constant(challengesViewModel.numberOfAnswered)
            )
                .tabItem({
                    VStack {
                        Image(systemName: "rectangle.dock")
                        Text("Challenge")
                    }
                })
                .tag(1)
                .environment(\.questionsPerSession, challengesViewModel.numberOfQuestions)
        }
        .accentColor(.orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(ChallengesViewModel())
    }
}
