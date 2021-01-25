//
//  Lifeline.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class Lifeline {
    var question:Question
    init(question:Question) {
        self.question=question
    }
    
    func FiftyFifty() {
        let half=question.choices.count/2
        var uncheckedNum:Int
        while(question.choices.count>half) {
            uncheckedNum=Int.random(in: 0..<question.choices.count)
            if(question.choices[uncheckedNum].label != question.key){
                question.choices.remove(at: uncheckedNum)
            }
        }
        print("Two incorrect answers have been eliminated.")
        
        // Output question again
        print(question.quiz)
          
        // Output choices again
        for choice in question.choices {
            print("\(choice.label): \(choice.content)")
        }
    }
    
    func AskAudience() {
        let vote1=Int.random(in: 0..<100)
        let vote2=Int.random(in: 0..<100)
        let vote3=Int.random(in: 0..<100)
        let vote4=Int.random(in: 0..<100)
        
        var sum:Int=0
        sum=vote1+vote2+vote3+vote4
        let percentage1:Int=vote1*100/sum
        let percentage2:Int=vote2*100/sum
        let percentage3:Int=vote3*100/sum
        let percentage4:Int=vote4*100/sum
        
        print("The result of the vote has been displayed below:")
        print("A: \(percentage1)%   B: \(percentage2)%  C: \(percentage3)%  D: \(percentage4)%")
    }
    
    func PhoneFriend() {
        let randomNum=Int.random(in: 0..<question.choices.count)
        print("Your friend's recommendation is \(question.choices[randomNum].label)")
    }
}
