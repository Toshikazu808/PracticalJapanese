//
//  ChartViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/15/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class ChartViewController: UIViewController {
    
    @IBOutlet var blankSpaceImages: [UIImageView]!
    @IBOutlet var characterImages: [UIImageView]!
    var gestureRecognizers = GestureRecognizers()
    let basicStack = Cards().basicStack
    var cardSounds:[String] = [String]()
    var soundFile: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        stackIndicator = Cards().basicStack
//        getCardStack =  HiraganaKatakanaCardStacks().getCards()
        
        for i in 0..<blankSpaceImages.count {
            blankSpaceImages[i].alpha = 0
        }
        
        var characterImagesTapped = [UITapGestureRecognizer?](repeating: nil, count: characterImages.count)
        
        for i in 0..<characterImages.count {
            characterImages[i].alpha = 1
            characterImages[i].transform = characterImages[i].transform.rotated(by: CGFloat(Double.pi / 2))
            characterImages[i].layer.cornerRadius = 15
            characterImages[i].layer.borderWidth = 0
            characterImages[i].isUserInteractionEnabled = true
            
            characterImagesTapped[i] = UITapGestureRecognizer(target: self, action: #selector(characterButtonsTapped))
            characterImagesTapped[i]?.numberOfTapsRequired = 1
            characterImages[i].addGestureRecognizer(characterImagesTapped[i]!)
            
            if Constants.viewControllerNumber == 1 {
                characterImages[i].image = UIImage(named: "Hbasic\(i)")
            } else if Constants.viewControllerNumber == 2 {
                characterImages[i].image = UIImage(named: "Kbasic\(i)")
            }
        }
        
        for i in 0..<basicStack {
            cardSounds.append("soundBasic\(i)")
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
    
    
    @objc func characterButtonsTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        
        let url = Bundle.main.url(forResource: cardSounds[tag], withExtension: "m4a")
        guard url != nil else { return }
        do {
            soundFile = try AVAudioPlayer(contentsOf: url!)
            soundFile?.play()
        } catch {
            print("\nError playing sound")
        }
        
    } // End of @objc func characterButtonsTapped
    

} // End of class ChartViewController
