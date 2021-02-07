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
    var tableContent:[TableViewContent] = []
    var soundFile: AVAudioPlayer?
    var vocabSounds:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if K.soundOn == false {
            let speakerIcon = UIImage(systemName: SystemImageNames.speakerSlash)
            speakerButton.setImage(speakerIcon, for: .normal)
        } else {
            let speakerIcon = UIImage(systemName: SystemImageNames.speaker)
            speakerButton.setImage(speakerIcon, for: .normal)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.black
        cardStack = VocabCardStack().getCards()
        createLists()
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.isUserInteractionEnabled = true
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
    
    
    fileprivate func createLists() {
        switch K.vocabStackSelection {
        case 0:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.colorStackJ[i],
                    englishWord: K.colorStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Colors"
        case 1:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.animalStackJ[i],
                    englishWord: K.animalStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Animals"
        case 2:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.oceanAnimalStackJ[i],
                    englishWord: K.oceanAnimalStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Ocean Animals"
        case 3:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.natureStackJ[i],
                    englishWord: K.natureStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Nature"
        case 4:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.bugStackJ[i],
                    englishWord: K.bugStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Bugs"
        case 5:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.vegetableStackJ[i],
                    englishWord: K.vegetableStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Vegetables"
        case 6:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.fruitStackJ[i],
                    englishWord: K.fruitStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "Fruits"
        case 7:
            print("\nCreating list for \(K.stackOrder[K.vocabStackSelection])")
            for i in 0..<cardStack.count {
                let cellContent = TableViewContent(
                    japaneseWord: K.houseStackJ[i],
                    englishWord: K.houseStack[i],
                    vocabImage: UIImage(named: "\(cards.vocabFront[K.vocabStackSelection])\(i)")!,
                    vocabSound: "\(cards.vocabSounds[K.vocabStackSelection])\(i)")
                tableContent.append(cellContent)
                vocabSounds.append(cellContent.vocabSound)
            }
            listLabel.text = "House"
        default:
            print("Unregistered selection")
            break
        }
    } // End of func createLists
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } // End of @IBAction func backButtonTapped
       

    @IBAction func speakerButtonTapped(_ sender: UIButton) {
        if K.soundOn == false {
            K.soundOn = true
            let speakerIcon = UIImage(systemName: SystemImageNames.speaker)
            speakerButton.setImage(speakerIcon, for: .normal)
        } else {
            K.soundOn = false
            let speakerIcon = UIImage(systemName: SystemImageNames.speakerSlash)
            speakerButton.setImage(speakerIcon, for: .normal)
        }
    } // End of @IBAction func speakerButtonTapped
   
    
} // End of class listViewController



extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    } // End of func numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = tableContent[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TableCell
        
        cell.japaneseTextLabel?.text = content.japaneseWord
        cell.englishTextLabel?.text = content.englishWord
        cell.cardImageView?.image = content.vocabImage
        
        cell.tapAction = { [weak self] cell in self?.speakerTapped() }
        cell.delegate = self
        
        return cell
    } // End of func cellForRowAt
    
    func speakerTapped() {
        print("speaker button tapped")
    } // End of func speakerTapped
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let cellHeight = screenSize.height / 8
        return cellHeight
    } // End of heightForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell tapped: \(indexPath.row)")
        if K.soundOn == true {
            let url = Bundle.main.url(forResource: vocabSounds[indexPath.row], withExtension: "m4a")
            print(url!)
            guard url != nil else { return }
            do {
               soundFile = try AVAudioPlayer(contentsOf: url!)
                soundFile?.play()
            } catch {
                print("\nError playing sound: \(error)")
            }
        } else {
            print("sound off")
        }
    } // End of func tableView
    
} // End of extension UITableViewDataSource, UITableViewDelegate


extension ListViewController: TableCellDelegate {
    func speakerTapped(with tagNum: Int) {
        print("speaker tapped \(tagNum)")
    }
} // End of extension ListViewController
