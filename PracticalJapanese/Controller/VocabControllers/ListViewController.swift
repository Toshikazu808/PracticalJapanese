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
    
    @IBOutlet weak var tableView: UITableView!
    var vocabList:[String] = []
    var vocabSoundsList:[String] = []
    let cards = Cards()
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        cardStack = VocabCardStack().getCards()
        
        switch Constants.vocabStackSelection {
        case 0:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.colorStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
            print(images)
        case 1:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.animalStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 2:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.oceanAnimalStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 3:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.natureStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 4:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.bugStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 5:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.vegetableStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 6:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.fruitStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        case 7:
            print("\nCreating list for \(Constants.stackOrder[Constants.vocabStackSelection])")
            for i in 0..<cardStack.count {
                vocabList.append("\(Constants.houseStack[i])")
                vocabSoundsList.append("\(cards.vocabSounds[Constants.vocabStackSelection])\(i)")
                images.append(UIImage(named: "\(cardStack[i].cardName)")!)
            }
        default:
            print("Unregistered selection")
            break
        }
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "ImageViewCell")

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
       

} // End of class listViewController




extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
        
    } // End of func tableView
} // End of extension ListViewController


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabList.count
    } // End of func tableView
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell, for: indexPath) as! TableViewCell
        cell.textLabel?.text = vocabList[indexPath.row]
        cell.mainImageView.image = images[indexPath.row]
        return cell
    } // End of func tableView
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = images[indexPath.row]
        let imageCrop = currentImage.getCropRatio()
        return tableView.frame.width / imageCrop
    } // End of func tableView
    
} // End of extension ListViewController


extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = self.size.width / self.size.height
        return widthRatio
    }
} // End of extension UIImage
