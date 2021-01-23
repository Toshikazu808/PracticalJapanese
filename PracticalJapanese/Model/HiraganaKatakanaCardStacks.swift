//
//  HKCards.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/10/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation



class HiraganaKatakanaCardStacks {
      
    
    func getCards() -> [Cards] {
        var generatedNumbersArray = [Int]()
        var generatedCardArray = [Cards]()
        
        generateArrays(&generatedNumbersArray, &generatedCardArray, stackIndicator: Constants.stackIndicator)
        randomizeArray(&generatedCardArray)
        
        return generatedCardArray
    } // End of func getCards
    
    
    fileprivate func generateArrays(_ generatedNumbersArray: inout [Int], _ generatedCardArray: inout [Cards], stackIndicator: Int) -> Void {
        // Randomly generate number of cards based on which stack is chosen
        while generatedNumbersArray.count < Constants.stackIndicator {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(Constants.stackIndicator)))
            print(randomNumber)
            
            if generatedNumbersArray.contains(randomNumber) == false {
                generatedNumbersArray.append(randomNumber)
                let cards = Cards()
                
                if Constants.viewControllerNumber == 1 {
                    switch Constants.stackIndicator {
                    case Cards().basicStack:
                        cards.cardName = "Hbasic\(randomNumber)"
                        cards.cardBack = "basicBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundBasic\(randomNumber)"
                    
                    case Cards().tentenStack:
                        cards.cardName = "Htenten\(randomNumber)"
                        cards.cardBack = "tentenBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundTenten\(randomNumber)"
                        
                    case Cards().comboStack:
                        cards.cardName = "Hcombo\(randomNumber)"
                        cards.cardBack = "comboBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundCombo\(randomNumber)"
                        
                    default:
                        break
                    }
                } else if Constants.viewControllerNumber == 2 {
                    switch Constants.stackIndicator {
                    case Cards().basicStack:
                        cards.cardName = "Kbasic\(randomNumber)"
                        cards.cardBack = "basicBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundBasic\(randomNumber)"
                    
                    case Cards().tentenStack:
                        cards.cardName = "Ktenten\(randomNumber)"
                        cards.cardBack = "tentenBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundTenten\(randomNumber)"
                        
                    case Cards().comboStack:
                        cards.cardName = "Kcombo\(randomNumber)"
                        cards.cardBack = "comboBack\(randomNumber)"
                        generatedCardArray.append(cards)
                        cards.soundName = "soundCombo\(randomNumber)"
                        
                    default:
                        break
                    }
                } // End of creating card objects
                
            } // End of generatedNumbersArray.contains(randomNumber) == false
        } // End of while loop
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
    } // Enf of func randomizeArray
    
    
    func getAllCards() -> [Cards] {
        var generateCombinedArray = [Cards]()
        
        let firstStack:[Cards] = getStackOne()
        let secondStack:[Cards] = getStackTwo()
        let thirdStack:[Cards] = getStackThree()
        
        generateCombinedArray.append(contentsOf: firstStack)
        generateCombinedArray.append(contentsOf: secondStack)
        generateCombinedArray.append(contentsOf: thirdStack)
        print(generateCombinedArray)
        
        randomizeArray(&generateCombinedArray)
        print(generateCombinedArray)
        
        return generateCombinedArray
    } // end of func shuffleAllCards
    
    
    fileprivate func getStackOne() -> [Cards] {
        var generateNumbersArrayOne = [Int]()
        var generatedCardArrayOne = [Cards]()
        
        while generateNumbersArrayOne.count < Cards().basicStack {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(Cards().basicStack)))
            
            if generateNumbersArrayOne.contains(randomNumber) == false {
                generateNumbersArrayOne.append(randomNumber)
                let cards = Cards()
                
                if Constants.viewControllerNumber == 1 {
                    cards.cardName = "Hbasic\(randomNumber)"
                    cards.cardBack = "basicBack\(randomNumber)"
                    generatedCardArrayOne.append(cards)
                    cards.soundName = "soundBasic\(randomNumber)"
                } else if Constants.viewControllerNumber == 2 {
                    cards.cardName = "Kbasic\(randomNumber)"
                    cards.cardBack = "basicBack\(randomNumber)"
                    generatedCardArrayOne.append(cards)
                    cards.soundName = "soundBasic\(randomNumber)"
                }
            }
        } // end of while loop
        return generatedCardArrayOne
    } // end of fileprivate func getStackOne
    
    
    fileprivate func getStackTwo() -> [Cards] {
        var generateNumbersArrayTwo = [Int]()
        var generatedCardArrayTwo = [Cards]()
        
        while generateNumbersArrayTwo.count < Cards().tentenStack {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(Cards().tentenStack)))
            
            if generateNumbersArrayTwo.contains(randomNumber) == false {
                generateNumbersArrayTwo.append(randomNumber)
                let cards = Cards()
                
                if Constants.viewControllerNumber == 1 {
                    cards.cardName = "Htenten\(randomNumber)"
                    cards.cardBack = "tentenBack\(randomNumber)"
                    generatedCardArrayTwo.append(cards)
                    cards.soundName = "soundTenten\(randomNumber)"
                } else if Constants.viewControllerNumber == 2 {
                    cards.cardName = "Ktenten\(randomNumber)"
                    cards.cardBack = "tentenBack\(randomNumber)"
                    generatedCardArrayTwo.append(cards)
                    cards.soundName = "soundTenten\(randomNumber)"
                }
            }
        } // end of while loop
        return generatedCardArrayTwo
    } // end of fileprivate func getStackTwo
    
    
    fileprivate func getStackThree() -> [Cards] {
        var generateNumbersArrayThree = [Int]()
        var generatedCardArrayThree = [Cards]()
        
        while generateNumbersArrayThree.count < Cards().basicStack {
            let randomNumber:Int = Int(arc4random_uniform(UInt32(Cards().basicStack)))
            
            if generateNumbersArrayThree.contains(randomNumber) == false {
                generateNumbersArrayThree.append(randomNumber)
                let cards = Cards()
                
                if Constants.viewControllerNumber == 1 {
                    cards.cardName = "Hcombo\(randomNumber)"
                    cards.cardBack = "comboBack\(randomNumber)"
                    generatedCardArrayThree.append(cards)
                    cards.soundName = "soundCombo\(randomNumber)"
                } else if Constants.viewControllerNumber == 2 {
                    cards.cardName = "Kcombo\(randomNumber)"
                    cards.cardBack = "comboBack\(randomNumber)"
                    generatedCardArrayThree.append(cards)
                    cards.soundName = "soundCombo\(randomNumber)"
                }
            }
        } // end of while loop
        return generatedCardArrayThree
    } // end of fileprivate func getStackThree
    
    
} // End of class HiraganaKatakanaCardStacks
