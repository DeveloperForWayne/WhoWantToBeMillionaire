//
//  Player.swift
//  WhoWantToBeMillionaire
//
//  Created by Wei Xu(101059762) on 2020-03-13.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class Player {
    var name:String
    var prizeEarned:Int
    var fiftyFiftyUsed:Int
    var askAudienceUsed:Int
    var phoneFriendUsed:Int
    
    init(name:String) {
        self.name=name
        self.prizeEarned=0
        self.fiftyFiftyUsed=0
        self.askAudienceUsed=0
        self.phoneFriendUsed=0
    }
}

