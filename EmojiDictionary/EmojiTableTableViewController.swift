//
//  EmojiTableTableViewController.swift
//  EmojiDictionary
//
//  Created by Артем Мартиросян on 28/02/2019.
//  Copyright © 2019 Артем Мартиросян. All rights reserved.
//

import UIKit

class EmojiTableTableViewController: UITableViewController {

    var emojis: [[Emoji]] =
     [
        [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        ],
        [
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow")
        ],
        [
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Chesdackered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
        Emoji(symbol: "🌑", name: "bnBroken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "🌈", name: "Snbhjore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🍠", name: "mnbCheckered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory")
        ]
    ]
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Smileys & People"
        case 1:
            return "Food & Drink"
        case 2:
            return "Activity"
        default:
            return ""
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return emojis.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return emojis[0].count
        case 1:
            return emojis[1].count
        case 2:
            return emojis[2].count
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emojis[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        cell.showsReorderControl = true
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.section][indexPath.row]
        print("\(emoji.symbol) \(indexPath)")
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis[fromIndexPath.section].remove(at: fromIndexPath.row)
        emojis[to.section].insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
