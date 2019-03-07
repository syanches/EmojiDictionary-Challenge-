//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Артем Мартиросян on 28/02/2019.
//  Copyright © 2019 Артем Мартиросян. All rights reserved.
//

import Foundation


class Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var ArchiveURL: URL {
        let url = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: .userDomainMask).first!
        let final = url.appendingPathComponent("emojis").appendingPathExtension("plist")
        return final
    }
    
    init(symbol: String, name: String, description: String, usage:String){
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }

    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        
        let encodedEmojis = try? propertyListEncoder.encode(emojis)
        try? encodedEmojis?.write(to: ArchiveURL)
    }
    
    
    static func loadFromFile() -> [Emoji]? {
        let propertyListDecoder = PropertyListDecoder()
        guard let retrieveData = try? Data(contentsOf: ArchiveURL),
            let decodedEmojis = try?  propertyListDecoder.decode([Emoji].self, from: retrieveData)
            else {return nil}
        return decodedEmojis
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        let emojis = [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
            Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Chesdackered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
            Emoji(symbol: "🌑", name: "bnBroken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "🌈", name: "Snbhjore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            Emoji(symbol: "🍠", name: "mnbCheckered Flag", description: "A black-and-white checkered flag.", usage: "completion")
        ]
        
        return emojis
    }
}


