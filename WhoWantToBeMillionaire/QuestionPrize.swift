//
//  QuestionPrize.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

struct QuestionPrize {
    var question:Question
    var prize:Int
    init(question:Question, prize:Int){
        self.question=question
        self.prize=prize
    }
}
