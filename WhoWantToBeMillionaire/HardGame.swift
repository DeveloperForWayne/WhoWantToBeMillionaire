//
//  HardGame.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class HardGame:Game{
    init(playerName:String, Round1Questions:[Question], Round2Questions:[Question], Round3Questions:[Question]){
          let R1Q1Prize = QuestionPrize(question: Round1Questions[0], prize: 100)
          let R1Q2Prize = QuestionPrize(question: Round1Questions[1], prize: 200)
          let R1Q3Prize = QuestionPrize(question: Round1Questions[2], prize: 300)
          let R1Q4Prize = QuestionPrize(question: Round1Questions[3], prize: 500)
          let R1Q5Prize = QuestionPrize(question: Round1Questions[4], prize: 1000)
          let R1Prizes=[R1Q1Prize, R1Q2Prize, R1Q3Prize, R1Q4Prize, R1Q5Prize]
          
          let R2Q1Prize = QuestionPrize(question: Round2Questions[0], prize: 2000)
          let R2Q2Prize = QuestionPrize(question: Round2Questions[1], prize: 4000)
          let R2Q3Prize = QuestionPrize(question: Round2Questions[2], prize: 8000)
          let R2Q4Prize = QuestionPrize(question: Round2Questions[3], prize: 16000)
          let R2Q5Prize = QuestionPrize(question: Round2Questions[4], prize: 32000)
          let R2Prizes=[R2Q1Prize, R2Q2Prize, R2Q3Prize, R2Q4Prize, R2Q5Prize]
          
          let R3Q1Prize = QuestionPrize(question: Round3Questions[0], prize: 64000)
          let R3Q2Prize = QuestionPrize(question: Round3Questions[1], prize: 125000)
          let R3Q3Prize = QuestionPrize(question: Round3Questions[2], prize: 250000)
          let R3Q4Prize = QuestionPrize(question: Round3Questions[3], prize: 500000)
          let R3Q5Prize = QuestionPrize(question: Round3Questions[4], prize: 1000000)
          let R3Prizes=[R3Q1Prize, R3Q2Prize, R3Q3Prize, R3Q4Prize, R3Q5Prize]
          
        super.init(player: Player(name: playerName), Round1QuestionPrize: R1Prizes, Round2QuestionPrize: R2Prizes, Round3QuestionPrize: R3Prizes)
      }
      
      func PlayRound1() {
           var confirmed:String
           var userChoice:String
           
           print("Round 1 started!")
           
           for (index,roundQuestion) in Round1QuestionPrize.enumerated() {
               // Output question
               print(roundQuestion.question.quiz)
               
               // Output choices
               for choice in roundQuestion.question.choices {
                   print("\(choice.label): \(choice.content)")
               }
               
               // Confirm process
               repeat {
                   print("Enter your choice:")
                   userChoice=readLine()!.uppercased()
                   
                   print("Is that your Final Answer? (Yes(Y), No(N))")
                   confirmed=readLine()!.uppercased()
                   
               } while(confirmed=="N" || confirmed == "NO")
               
               // Correct answer
               if(userChoice==roundQuestion.question.key) {
                   let prizeEarned=CurrencyFormat(currency: roundQuestion.prize)!
                   if(index<(Round1QuestionPrize.count-1)) {
                       print("The answer of Question \(index+1) is correct.")
                       print("You have reached \(prizeEarned)")
                   } else {
                       print("Congratulations! You passed Round 1 and won \(prizeEarned)")
                       print("Enter your choice: 1.Walk Away 2.Move on to next Round")
                       
                       let WalkAwayChoice=readLine()
                       if(WalkAwayChoice=="1") {
                           player.prizeEarned=roundQuestion.prize
                           print("\(player.name) walk away with \(prizeEarned)")
                       } else {
                           print("Round 1 passed!")
                           PlayRound2()
                       }
                   }
               } else {
                   print("The answer is wrong! You walk away with no money!")
                   break
               }
           }
    }
}
