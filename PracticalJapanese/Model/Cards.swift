//
//  Cards.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/11/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import Foundation

var cardStack:[Cards] = []

class Cards {
        
    var cardName:String = ""
    var cardBack:String = ""
    var soundName:String = ""

    let basicStack:Int = 46
    let tentenStack:Int = 25
    let comboStack:Int = 33

    var isFlippedBool = false
    
    let animalStack:Int = 34
    let bugStack:Int = 17
    let colorStack:Int = 11
    let fruitStack:Int = 19
    let houseStack:Int = 45
    let natureStack:Int = 35
    let oceanAnimalStack:Int = 20
    let vegetableStack:Int = 26
    
    let vocabFront:[String] = [
        /* 0 */ "color",
        /* 1 */ "animal",
        /* 2 */ "oceanAnimals",
        /* 3 */ "nature",
        /* 4 */ "bugs",
        /* 5 */ "vegetables",
        /* 6 */ "fruits",
        /* 7 */ "house"
    ]
    let vocabBack:[String] = [
        /* 0 */ "colorBack",
        /* 1 */ "animalBack",
        /* 2 */ "oceanAnimalsBack",
        /* 3 */ "natureBack",
        /* 4 */ "bugsBack",
        /* 5 */ "vegetablesBack",
        /* 6 */ "fruitsBack",
        /* 7 */ "houseBack"
    ]
    let vocabSounds:[String] = [
        /* 0 */ "soundsColors",
        /* 1 */ "soundsAnimals",
        /* 2 */ "soundsOceanAnimals",
        /* 3 */ "soundsNature",
        /* 4 */ "soundsBugs",
        /* 5 */ "soundsVegetables",
        /* 6 */ "soundsFruits",
        /* 7 */ "soundsHouse"
    ]

    
    var kanjiLevel:Int = 0

} // End of class Cards
