//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Артем Мартиросян on 28/02/2019.
//  Copyright © 2019 Артем Мартиросян. All rights reserved.
//

import Foundation


class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    //var emojis: [Emoji]
    
    
    init(symbol: String, name: String, description: String, usage:String){
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }

    
}


