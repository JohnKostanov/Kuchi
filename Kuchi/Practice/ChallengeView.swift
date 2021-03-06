/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    @State var showAnswers = false
    @Binding var numberOfAnswered: Int
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.questionsPerSession) var questionsPerSession
    
    
    @ViewBuilder
    var body: some View {
        if verticalSizeClass == .compact {
            VStack {
                // 2
                HStack {
                    Button(action: {
                        self.showAnswers = !self.showAnswers
                    }) {
                        // 3
                        QuestionView(question: challengeTest.challenge.question)
                    }
                    
                    // 4
                    if showAnswers {
                        Divider()
                        // 5
                        ChoicesView(challengeTest: challengeTest)
                        
                    }
                }
                
                ScoreView(numberOfQuestions: questionsPerSession, numberOfAnswered: $numberOfAnswered)
                
            }
        } else {
            VStack {
                // 2
                Button(action: {
                    self.showAnswers = !self.showAnswers
                }) {
                    // 3
                    QuestionView(question: challengeTest.challenge.question)
                        .frame(height: 300)
                }
                
                ScoreView(numberOfQuestions: questionsPerSession, numberOfAnswered: $numberOfAnswered)
                // 4
                if showAnswers {
                    Divider()
                    // 5
                    ChoicesView(challengeTest: challengeTest)
                        .frame(height: 300)
                        .padding()
                }
                
            }
        }
        
        
        //    HStack(alignment: .firstTextBaseline) {
        //        Text("Welcome to Kuchi").font(.caption)
        //            .layoutPriority(-1)
        //            .background(Color.red)
        //            .frame(width: 100, height: 50, alignment: .center)
        //            .minimumScaleFactor(0.5)
        //        Text("Welcome to Kuchi").font(.title)
        //                .layoutPriority(1)
        //                .background(Color.red)
        //        Button(action: {}, label: { Text("Ok").font(.body)})
        //    }
        //    .background(Color.yellow)
    }
}

struct ChallengeView_Previews: PreviewProvider {
    @State static var numberOfAnswered: Int = 0
    
    static let challengeTest = ChallengeTest(
        challenge: Challenge(
            question: "おねがい　します",
            pronunciation: "Onegai shimasu",
            answer: "Please"
        ),
        answers: ["Thank you", "Hello", "Goodbye"]
    )
    
    static var previews: some View {
        return ChallengeView(challengeTest: challengeTest, numberOfAnswered: $numberOfAnswered)
    }
    
}

