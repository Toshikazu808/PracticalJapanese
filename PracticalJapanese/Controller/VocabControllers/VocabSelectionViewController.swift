//
//  VocabSelectionViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 9/1/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit


class VocabSelectionViewController: UIViewController {

    @IBOutlet var vocabButtons: [UIButton]!
    var card = Cards()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<vocabButtons.count {
            vocabButtons[i].layer.cornerRadius = 15
            vocabButtons[i].layer.borderWidth = 0
            vocabButtons[i].alpha = 1
        }
    } // End of viewDidLoad
    
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        Constants.viewControllerNumber = 0
        Constants.stackIndicator = 0
        Constants.showFront = true
        Constants.vocabStackSelection = 0
        Constants.stackTotal = 0
    } // End of func homeButtonTapped
    
   
    @IBAction func vocabButtonsTapped(_ sender: UIButton) {
        // Each button performs Storyboard Modal Segue to VocabViewController
        print("test")
        let tag:Int = sender.tag
        switch tag {
        case 0:
            print("Colors stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.colorStack.count
        case 1:
            print("Animals stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.animalStack.count
        case 2:
            print("Ocean Animals stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.oceanAnimalStack.count
        case 3:
            print("Nature stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.natureStack.count
        case 4:
            print("Bugs stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.bugStack.count
        case 5:
            print("Vegetables stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.vegetableStack.count
        case 6:
            print("Fruits stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.fruitStack.count
        case 7:
            print("House stack tapped")
            Constants.vocabStackSelection = tag
            Constants.stackTotal = Constants.houseStack.count
        default:
            print("Unregistered selection")
            break
        }
        print(Constants.vocabStackSelection)
        performSegue(withIdentifier: Constants.vocabSegue, sender: nil)
    } // End of @IBAction func vocabButtonsTapped
    

} // End of class VocabViewController
