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
    
    static var soundOn:Bool = false
    
    static let cell:String = "cell"
    static let cellNibName:String = "TableCell"
    static let cellIdentifier:String = "ReusableCell"
    
    static let stackOrder:[String] = [
        "colorStack", "animalStack", "oceanAnimalStack", "natureStack", "bugStack",
        "vegetableStack", "fruitStack", "houseStack"
    ]
    
    static let colorStack:[String] = [
        "Red", "Yellow", "Blue", "Orange", "Green",
        "Purple", "Black", "White", "Gray", "Brown",
        "Pink"
    ]
    static let colorStackJ:[String] = [
        "赤（あか）", "黄色（きいろ）", "青（あお）", "オレンジ", "緑（みどり）",
        "紫（むらさき）", "黒（くろ）", "白（しろ）", "灰色（はいいろ）", "茶色（ちゃいろ）",
        "ピンク"
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
    static let animalStackJ:[String] = [
        "ライオン", "虎（とら）", "熊（くま）", "河馬（かば）", "キリン",
        "さい", "猿（さる）", "おおかみ", "犬（いぬ）", "猫（ねこ）",
        "兎（うさぎ）", "鳥（とり）", "ふくろう", "わし", "たか",
        "カラス", "ハムスター", "鹿（しか）", "ロバ", "豚（ぶた）",
        "猪（いのしし）", "鶏（にわとり）", "ひよこ", "卵（たまご）", "羊（ひつじ）",
        "カエル", "亀", "ワニ", "しまうま", "牛（うし）",
        "象（ぞう）", "蛇（へび）", "龍（りゅう/たつ）", "カンガルー"
    ]
    
    static let oceanAnimalStack:[String] = [
        "Dolphin", "Whale", "Orca", "Shark", "Squid",
        "Octopus", "Fish", "Sea lion", "Seal", "Coral",
        "Seaweed", "Sea turtle", "Eel", "Shrimp", "Crab",
        "Lobster", "Shell", "Sea urchin", "Jellyfish", "Stingray"
    ]
    static let oceanAnimalStackJ:[String] = [
        "イルカ", "鯨（くじら）", "鯱（しゃち）", "鮫（さめ）", "イカ",
        "蛸（たこ）", "魚（さかな）", "アシカ", "アザラシ", "珊瑚（さんご）",
        "海藻（かいそう）", "海亀（うみがめ）", "鰻（うなぎ）", "海老（えび）", "蟹（かに）",
        "ロブスター", "貝（かい）", "うに", "クラゲ", "エイ"
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
    static let natureStackJ:[String] = [
        "木（き）", "花（はな）", "草（くさ）", "野原（のはら）", "林（はやし）",
        "森（もり）", "芝生（しばふ）", "茸（きのこ）", "石（いし）", "岩（いわ）",
        "丘（おか）", "山（やま）", "谷（たに）", "崖（がけ）", "砂漠（さばく",
        "ビーチ", "海（うみ）", "波（なみ）", "砂（すな）", "土（つち）",
        "泥（どろ）", "湖（みずうみ）", "川（かわ）", "水溜り（みずたまり）", "光（ひかり）",
        "太陽（たいよう）", "月（つき）", "風（かぜ）", "雨（あめ）", "雲（くも）",
        "雷（かみなり）", "稲妻（いなずま）", "竜巻（たつまき）", "地震（じしん）", "津波（つなみ）"
    ]
    
    static let bugStack:[String] = [
        "Bugs", "Grasshopper", "Spider", "Centipede", "Fly",
        "Mosquito", "Cicada", "Caterpillar", "Worm", "Cocoon",
        "Butterfly", "Rhinoceros Beetle", "Ladybug", "Honey bee", "Hornet",
        "Scorpion", "Dragonfly"
    ]
    static let bugStackJ:[String] = [
        "虫（むし）", "バッタ", "蜘蛛（くも）", "ムカデ", "ハエ",
        "蚊（か）", "蝉（せみ）", "芋虫（いもむし）", "ミミズ", "繭（まゆ）",
        "蝶（ちょう）", "甲虫（かぶとむし）", "てんとう虫（てんとうむし）", "蜜蜂（みつばち）", "スズメ蜂（スズメばち）",
        "蠍（さそり）", "蜻蛉（とんぼ）"
    ]
    
    static let vegetableStack:[String] = [
        "Vegetables", "Lettuce", "Cabbage", "Tomato", "Eggplant",
        "Celery", "Cucumber", "Carrot", "Potato", "Onion",
        "Garlic", "Ginger", "Myoga", "Wasabi", "Green onion",
        "Spinach", "Seaweed", "Mushroom", "Parsley", "Broccoli",
        "Cauliflower", "Bell pepper", "Chili pepper", "Olive", "Jalapeno",
        "Scallions"
    ]
    static let vegetableStackJ:[String] = [
        "野菜（やさい）", "レタス", "キャベツ", "トマト", "茄子（なす）",
        "セロリ", "きゅうり", "人参（にんじん）", "じゃが芋（じゃがいも）", "玉ねぎ（たまねぎ）",
        "にんにく", "生姜（しょうが）", "茗荷（みょうが）", "わさび", "ねぎ",
        "ほうれん草（ほうれんそう）", "若布（わかめ）", "茸（きのこ）", "バセリ", "ブロコリ",
        "カリフラワー", "ピーマン", "唐辛子（とうがらし）", "オリーブ", "ハラペーニョ",
        "長ねぎ（ながねぎ）"
    ]
    
    static let fruitStack:[String] = [
        "Fruits", "Apple", "Banana", "Pear", "Watermelon",
        "Melon", "Strawberry", "Lemon", "Lime", "Grapes",
        "Peach", "Pineapple", "Mango", "Papaya", "Kiwi",
        "Cherry", "Blueberry", "Blackberry", "Raspberry"
    ]
    static let fruitStackJ:[String] = [
        "果物（くだもの）", "りんご", "バナナ", "梨（なし）", "スイカ",
        "メロン", "苺（いちご）", "レモン", "ライム", "ぶどう",
        "桃（もも）", "パイナップル", "マンゴ", "パパイヤ", "キウイ",
        "さくらんぼ", "ブルーベリー", "ブラックベリー", "ラズベリー"
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
    static let houseStackJ:[String] = [
        "椅子（いす）", "ベッド", "布団（ふとん）", "枕（まくら）", "毛布（もうふ）",
        "窓（まど）", "扉（とびら）", "押入（おしいれ）", "箪笥（たんす）", "本棚（ほんだな）",
        "棚（たな）", "机（つくえ）", "床（ゆか）", "カーペット", "壁（かべ）",
        "屋上（おくじょう）", "屋根（やね）", "お手洗い（おてあらい）", "流し台（ながしだい）", "シャワー",
        "お風呂（おふろ）", "廊下（ろうか）", "台所（だいどころ）", "部屋（へや）", "寝室（しんしつ）",
        "居間（いま）", "玄関（げんかん）", "庭（にわ）", "車（くるま）", "トラック",
        "車庫（しゃこ）", "食卓（しょくたく）", "フォーク", "スプーン", "お箸（おはし）",
        "れんげ", "お玉（おたま）", "鍋（なべ）", "フライパン", "焜炉（こんろ）",
        "換気扇（かんきせん）", "扇風機（せんぷうき）", "冷房（れいぼう）", "暖房（だんぼう）", "暖炉（だんろ）"
    ]
    
} // End of struct UniversalTrackers
