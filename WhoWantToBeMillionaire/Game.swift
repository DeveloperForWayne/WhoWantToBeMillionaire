//
//  Game.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class Game {
    var player:Player
    var Round1QuestionPrize:[QuestionPrize]
    var Round2QuestionPrize:[QuestionPrize]
    var Round3QuestionPrize:[QuestionPrize]
    
    init(player:Player, Round1QuestionPrize:[QuestionPrize], Round2QuestionPrize:[QuestionPrize], Round3QuestionPrize:[QuestionPrize]){
        self.player=player
        self.Round1QuestionPrize=Round1QuestionPrize
        self.Round2QuestionPrize=Round2QuestionPrize
        self.Round3QuestionPrize=Round3QuestionPrize
    }
    
    func PlayRound2(){
        var confirmed:String
        var userChoice:String
        
        print("Round 2 started!")
        
        for (index,roundQuestion) in Round2QuestionPrize.enumerated() {
            // Output question
            print(roundQuestion.question.quiz)
            
            // Output choices
            for choice in roundQuestion.question.choices {
                print("\(choice.label): \(choice.content)")
            }
            
            let LifelineUsed=player.fiftyFiftyUsed+player.askAudienceUsed+player.phoneFriendUsed
            // All Lifeline options has been used
            if(LifelineUsed<3) {
                print("Do you want to use LifeLine? (Yes(Y), No(N))")
                let lifeLineChoice=readLine()!.uppercased()
                if(lifeLineChoice=="Y" || lifeLineChoice=="YES") {
                    print("Which lifeline would you like to use?")
                    if(player.fiftyFiftyUsed==0) {
                        print("1. 50:50")
                    }
                    if(player.askAudienceUsed==0) {
                        print("2. Ask the Audience")
                    }
                    if(player.phoneFriendUsed==0) {
                        print("3. Phone a friend")
                    }
                    
                    let lifeLineOption=readLine()!
                    let lifeLine=Lifeline(question: roundQuestion.question)
                    
                    if(lifeLineOption=="1" && player.fiftyFiftyUsed==0) {
                        lifeLine.FiftyFifty()
                        player.fiftyFiftyUsed=1
                    } else if(lifeLineOption=="2" && player.askAudienceUsed==0) {
                        lifeLine.AskAudience()
                        player.askAudienceUsed=1
                    } else if(lifeLineOption=="3" && player.phoneFriendUsed==0) {
                        lifeLine.PhoneFriend()
                        player.phoneFriendUsed=1
                    }
                }
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
                if(index<(Round2QuestionPrize.count-1)) {
                    print("Congratulations! The answer of Question \(index+1) is correct.")
                    print("You have reached \(prizeEarned)")
                } else {
                    print("Congratulations! You passed Round 2 and won \(prizeEarned)")
                    print("Enter your choice: 1.Walk Away 2.Move on to next Round")
                    
                    let WalkAwayChoice=readLine()
                    if(WalkAwayChoice=="1") {
                        player.prizeEarned=roundQuestion.prize
                        print("\(player.name) walk away with \(prizeEarned)")
                    } else {
                        print("Round 2 passed!")
                        PlayRound3()
                    }
                }
            } else {
                player.prizeEarned=0
                print("The answer is wrong! You walk away with no money!")
                break
            }
        }
    }
    
    func PlayRound3(){
        var confirmed:String
        var userChoice:String
        
        print("Round 3 started!")
        
        for (index,roundQuestion) in Round3QuestionPrize.enumerated() {
            // Output question
            print(roundQuestion.question.quiz)
            
            // Output choices
            for choice in roundQuestion.question.choices {
                print("\(choice.label): \(choice.content)")
            }
            
            let LifelineUsed=player.fiftyFiftyUsed+player.askAudienceUsed+player.phoneFriendUsed
            // All Lifeline options has been used
            if(LifelineUsed<3) {
                print("Do you want to use LifeLine? (Yes(Y), No(N))")
                let lifeLineChoice=readLine()!.uppercased()
                if(lifeLineChoice=="Y" || lifeLineChoice=="YES") {
                    print("Which lifeline would you like to use?")
                    if(player.fiftyFiftyUsed==0) {
                        print("1. 50:50")
                    }
                    if(player.askAudienceUsed==0) {
                        print("2. Ask the Audience")
                    }
                    if(player.phoneFriendUsed==0) {
                        print("3. Phone a friend")
                    }
                    
                    let lifeLineOption=readLine()!
                    let lifeLine=Lifeline(question: roundQuestion.question)
                    
                    if(lifeLineOption=="1" && player.fiftyFiftyUsed==0) {
                        lifeLine.FiftyFifty()
                        player.fiftyFiftyUsed=1
                    } else if(lifeLineOption=="2" && player.askAudienceUsed==0) {
                        lifeLine.AskAudience()
                        player.askAudienceUsed=1
                    } else if(lifeLineOption=="3" && player.phoneFriendUsed==0) {
                        lifeLine.PhoneFriend()
                        player.phoneFriendUsed=1
                    }
                }
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
                if(index<(Round3QuestionPrize.count-1)) {
                    print("The answer of Question \(index+1) is correct.")
                    print("You have reached \(prizeEarned)")
                } else {
                    player.prizeEarned=roundQuestion.prize
                    print("Congratulations! \(player.name), You passed all the Rounds and won the \(prizeEarned) prize!")
                }
            } else {
                player.prizeEarned=0
                print("The answer is wrong! You walk away with no money!")
                break
            }
        }
    }
    
    func CurrencyFormat(currency:Int) -> String!{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        let priceString = currencyFormatter.string(from: NSNumber(value: currency))
        
        return priceString
    }
}
