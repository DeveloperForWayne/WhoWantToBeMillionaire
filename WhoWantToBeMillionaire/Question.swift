//
//  Question.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

struct Question {
    var quiz:String
    var choices:[Choice]
    var key:String
    init(quiz:String, choices:[Choice], key:String) {
        self.quiz=quiz
        self.choices=choices
        self.key=key
    }
}
