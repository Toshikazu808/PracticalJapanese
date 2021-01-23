//
//  UniversalTrackers.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 1/9/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import Foundation


struct Constants {
    
    static var viewControllerNumber:Int = 0
    static var shuffleAll:Bool = false
    
    static var vocabSegue:String = "toVocabVC"
    static var stackTotal:Int = 0
    static var stackIndicator:Int = 0
    static var showFront:Bool = true
    static var vocabStackSelection:Int = 0
    
    static let cell:String = "cell"
    
    static let stackOrder:[String] = [
        "colorStack", "animalStack", "oceanAnimalStack", "natureStack", "bugStack",
        "vegetableStack", "fruitStack", "houseStack"
    ]
    static let colorStack:[String] = [
        "Red", "Yellow", "Blue", "Orange", "Green",
        "Purple", "Black", "White", "Gray", "Brown",
        "Pink"
    ]
    static let animalStack:[String] = [
        "Lion", "Tiger", "Bear", "Hippo", "Giraffe",
        "Rhino", "Monkey", "Wolf", "Dog", "Cat",
        "Rabbit", "Bird", "Owl", "Eagle", "Hawk",
        "Crow", "Hamster", "Deer", "Donkey", "Pig",
        "Boar", "Chicken", "Chick", "Egg", "Sheep",
        "Frog", "Turtle", "Alligator", "Zebra", "Cow",
        "Elephant", "Snake", "Dragon", "Kangaroo"
    ]
    static let oceanAnimalStack:[String] = [
        "Dolphin", "Whale", "Orca", "Shark", "Squid",
        "Octopus", "Fish", "Sea lion", "Seal", "Coral",
        "Seaweed", "Sea turtle", "Eel", "Shrimp", "Crab",
        "Lobster", "Shell", "Sea urchin", "Jellyfish", "Stingray"
    ]
    static let natureStack:[String] = [
        "Tree", "Flower", "Grass", "Field", "Woods",
        "Forest", "Bush / lawn", "Mushroom", "Rocks", "Boulder",
        "Hill", "Mountain", "Valley", "Cliff", "Desert",
        "Beach", "Ocean", "Wave", "Sand", "Dirt",
        "Mud", "Lake", "River", "Puddle", "Light",
        "Sun", "Moon", "Wind", "Rain", "Cloud",
        "Thunder", "Lightning", "Tornado", "Earthquake", "Tsunami"
    ]
    static let bugStack:[String] = [
        "Bugs", "Grasshopper", "Spider", "Centipede", "Fly",
        "Mosquito", "Cicada", "Caterpillar", "Worm", "Cocoon",
        "Butterfly", "Rhinoceros Beetle", "Ladybug", "Honey bee", "Hornet",
        "Scorpion", "Dragonfly"
    ]
    static let vegetableStack:[String] = [
        "Vegetables", "Lettuce", "Cabbage", "Tomato", "Eggplant",
        "Celery", "Cucumber", "Carrot", "Potato", "Onion",
        "Garlic", "Ginger", "Myoga", "Wasabi", "Green onion",
        "Spinach", "Seaweed", "Mushroom", "Parsley", "Broccoli",
        "Cauliflower", "Bell pepper", "Chili pepper", "Olive", "Jalapeno",
        "Scallions"
    ]
    static let fruitStack:[String] = [
        "Fruits", "Apple", "Banana", "Pear", "Watermelon",
        "Melon", "Strawberry", "Lemon", "Lime", "Grapes",
        "Peach", "Pineapple", "Mango", "Papaya", "Kiwi",
        "Cherry", "Blueberry", "Blackberry", "Raspberry"
    ]
    static let houseStack:[String] = [
        "Chair", "Bed", "Futon", "Pillow", "Blanket",
        "Window", "Door", "Closet", "Dresser", "Bookshelf",
        "Shelf", "Desk", "Floor", "Carpet", "Wall",
        "Ceiling", "Roof", "Restroom", "Sink", "Shower",
        "Bath", "Hallway", "Kitchen", "Room", "Bedroom",
        "Living room", "Entrance", "Yard", "Car", "Truck",
        "Garage", "Dining table", "Fork", "Spoon", "Chopsticks",
        "Soup spoon", "Ladle", "Pot", "Frying pan", "Stove",
        "Stove vent", "Electric fan", "Air conditioner", "Heater", "Fireplace"
    ]
    
    
    
    
} // End of struct UniversalTrackers
