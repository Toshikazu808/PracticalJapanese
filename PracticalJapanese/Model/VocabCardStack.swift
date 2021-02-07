//
//  VocabCardStack.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 9/1/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import Foundation

class VocabCardStack {
    
    
    func getCards() -> [Cards] {
        var generatedNumbersArray = [Int]()
        var generatedCardArray = [Cards]()
        
        generateArrays(&generatedNumbersArray, &generatedCardArray, vocabSelection: K.vocabStackSelection)
        randomizeArray(&generatedCardArray)
        
        return generatedCardArray
    } // End of func getCards
    
    
    fileprivate func generateArrays(_ generatedNumbersArray: inout [Int], _ generatedCardArray: inout [Cards], vocabSelection: Int) -> Void {
        // MARK:- CHECK WHILE LOOP
        while generatedNumbersArray.count < K.stackTotal {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(K.stackTotal)))
            
            if generatedNumbersArray.contains(randomNumber) == false {
                generatedNumbersArray.append(randomNumber)
                let cards = Cards()
                
                switch K.vocabStackSelection {
                case 0:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 1:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 2:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 3:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 4:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 5:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 6:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                case 7:
                    cards.cardName = "\(cards.vocabFront[K.vocabStackSelection])\(randomNumber)"
                    cards.cardBack = "\(cards.vocabBack[K.vocabStackSelection])\(randomNumber)"
                    generatedCardArray.append(cards)
                    cards.soundName = "\(cards.vocabSounds[K.vocabStackSelection])\(randomNumber)"
                    
                default:
                    break
                }
                
            } // End of generatedNumbersArray.contains(randomNumber) == false
        } // End of while loop
//        print(Constants.cardStackIntValue)
    } // End of func generateArrays
    
    
    fileprivate func randomizeArray(_ generatedCardArray: inout [Cards]) -> Void {
        for i in 0..<generatedCardArray.count {
            // Find a random index to swap with
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardArray.count)))
            // Swap 2 cards
            let temporaryStorage = generatedCardArray[i]
            generatedCardArray[i] = generatedCardArray[randomNumber]
            generatedCardArray[randomNumber] = temporaryStorage
        }
    } // End of func randomizeArray
    
    
} // End of class VocabCardStack
