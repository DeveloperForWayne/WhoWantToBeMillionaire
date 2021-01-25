//
//  main.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

func main() {
    print("Enter player name:")
    let PlayerName=readLine()!
    var randomNumber:[Int]
    var round1Questions:[Question]
    var round2Questions:[Question]
    var round3Questions:[Question]
    
    print("Choose the game level(1.Easy, 2.Hard):")
    let GameLevel=readLine()!
    
    // Easy Option
    if(GameLevel=="1") {
        randomNumber=GetRandomNumber(numNeeded: 9)
        round1Questions=[Questions[randomNumber[0]], Questions[randomNumber[1]], Questions[randomNumber[2]]]
        round2Questions=[Questions[randomNumber[3]], Questions[randomNumber[4]], Questions[randomNumber[5]]]
        round3Questions=[Questions[randomNumber[6]], Questions[randomNumber[7]], Questions[randomNumber[8]]]
        let easyOption=EasyGame(playerName: PlayerName, Round1Questions: round1Questions, Round2Questions: round2Questions, Round3Questions: round3Questions)
        
        easyOption.PlayRound1()
        
        
    // Hard Option
    } else if(GameLevel=="2"){
        randomNumber=GetRandomNumber(numNeeded: 15)
        
        round1Questions=[Questions[randomNumber[0]], Questions[randomNumber[1]], Questions[randomNumber[2]], Questions[randomNumber[3]], Questions[randomNumber[4]]]
        round2Questions=[Questions[randomNumber[5]], Questions[randomNumber[6]], Questions[randomNumber[7]], Questions[randomNumber[8]], Questions[randomNumber[9]]]
        round3Questions=[Questions[randomNumber[10]], Questions[randomNumber[11]], Questions[randomNumber[12]], Questions[randomNumber[13]], Questions[randomNumber[14]]]
        let hardOption=HardGame(playerName: PlayerName, Round1Questions: round1Questions, Round2Questions: round2Questions, Round3Questions: round3Questions)
        
        hardOption.PlayRound1()
    }
}

func GetRandomNumber(numNeeded:Int) -> [Int]{
    var numbers:[Int]=[]
    var uncheckedNum:Int
    while(numbers.count<numNeeded) {
        uncheckedNum=Int.random(in: 0..<(Questions.count))
        if(!checkIfExisted(number:uncheckedNum, numbers:numbers)){
            numbers.append(uncheckedNum)
        }
    }
    return numbers
}

func checkIfExisted(number:Int, numbers:[Int]) -> Bool{
    var existed=false
    for randomNumber in numbers {
        if(number==randomNumber) {
            existed=true
        }
    }
    return existed
}

main()
