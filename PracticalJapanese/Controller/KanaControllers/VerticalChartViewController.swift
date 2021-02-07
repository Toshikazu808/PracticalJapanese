
//
//  VerticalChartViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 9/12/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class VerticalChartViewController: UIViewController {
    
    @IBOutlet var characterButtons: [UIButton]!
    @IBOutlet var blankSpaceButtons: [UIButton]!
    let basicStack = Cards().basicStack
    var cardSounds:[String] = [String]()
    var soundFile: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<characterButtons.count {
            if K.viewControllerNumber == 1 {
                if let buttonImage = UIImage(named: "Hbasic\(i)") {
                    characterButtons[i].setImage(buttonImage, for: .normal)
                }
            } else if K.viewControllerNumber == 2 {
                if let buttonImage = UIImage(named: "Kbasic\(i)") {
                    characterButtons[i].setImage(buttonImage, for: .normal)
                }
            }
            characterButtons[i].alpha = 1
            characterButtons[i].layer.cornerRadius = 10
            characterButtons[i].layer.borderWidth = 0
        }
        for i in 0..<blankSpaceButtons.count {
            blankSpaceButtons[i].alpha = 0
        }
        for i in 0..<basicStack {
            cardSounds.append("soundBasic\(i)")
        }
        
    } // End of viewDidLoad
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } // End of @IBAction func backButtonTapped
    
    
    @IBAction func characterButtonsTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        let url = Bundle.main.url(forResource: cardSounds[tag], withExtension: "m4a")
        guard url != nil else { return }
        do {
            soundFile = try AVAudioPlayer(contentsOf: url!)
            soundFile?.play()
            print("Playing sound file: \(String(describing: soundFile))")
        } catch {
            print("\nError playing sound")
        }
        
    } // End of @IBAction func characgerButtonsTapped
    


} // End of class VerticalChartViewController
