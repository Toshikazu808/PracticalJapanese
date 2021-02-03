//
//  listViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 1/16/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class ListViewController: UIViewController {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let cards = Cards()
    var images:[UIImage] = []
    
    var tableContent:[TableViewVocab] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.black
        speakerButton.alpha = 0
        cardStack = VocabCardStack().getCards()
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        switch Constants.vocabStackSelection {
        case 0:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.colorStackJ[i],
                    englishWord: Constants.colorStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Colors"
        case 1:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.animalStackJ[i],
                    englishWord: Constants.animalStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Animals"
        case 2:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.oceanAnimalStackJ[i],
                    englishWord: Constants.oceanAnimalStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Ocean Animals"
        case 3:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.natureStackJ[i],
                    englishWord: Constants.natureStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Nature"
        case 4:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.bugStackJ[i],
                    englishWord: Constants.bugStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Bugs"
        case 5:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.vegetableStackJ[i],
                    englishWord: Constants.vegetableStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Vegetables"
        case 6:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.fruitStackJ[i],
                    englishWord: Constants.fruitStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "Fruits"
        case 7:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewVocab(
                    japaneseWord: Constants.houseStackJ[i],
                    englishWord: Constants.houseStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[Constants.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
            }
            listLabel.text = "House"
        default:
            print("Unregistered selection")
            break
        }
        
    } // End of viewDidLoad
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    // End of initial setup
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } // End of @IBAction func backButtonTapped
       

    @IBAction func speakerButtonTapped(_ sender: UIButton) {
        speakerButton.setImage(UIImage(named: "speaker.wave.2"), for: UIControl.State.normal)
        speakerButton.isHidden = false
        speakerButton.alpha = 1
//        if Constants.soundOn == false {
//            Constants.soundOn = true
//            speakerButton.setImage(UIImage(named: SystemImageNames.speakerWave), for: .normal)
//            speakerButton.alpha = 0.8
//        } else {
//            Constants.soundOn = false
//            speakerButton.setImage(UIImage(named: SystemImageNames.speakerSlash), for: .normal)
//            speakerButton.alpha = 0.8
//        }
    } // End of @IBAction func speakerButtonTapped
    
} // End of class listViewController



extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    } // End of func tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = tableContent[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! TableCell
        
        cell.japaneseTextLabel?.text = content.japaneseWord
        cell.englishTextLabel?.text = content.englishWord
        cell.cardImageView?.image = content.vocabImage
        
        return cell
    } // End of func tableView
}


extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    } // End of func tableView
} // End of extension ListViewController
