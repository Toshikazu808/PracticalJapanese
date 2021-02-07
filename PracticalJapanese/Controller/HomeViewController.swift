//
//  ViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/7/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

//var viewControllerNumber:Int = 0
//var shuffleAll:Bool = false
//var soundOn:Bool = false

class HomeViewController: UIViewController {
    
    @IBOutlet var menuButtons: [UIButton]!
    @IBOutlet weak var stackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        K.viewControllerNumber = 0
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let stackWidth = screenWidth / 2
        
        for i in 0..<menuButtons.count {
            menuButtons[i].backgroundColor = UIColor.lightGray
            menuButtons[i].layer.cornerRadius = 11
            menuButtons[i].layer.borderColor = UIColor.white.cgColor
            menuButtons[i].layer.borderWidth = 2
            menuButtons[i].alpha = 1
        }
        stackView.frame.size.width = stackWidth
        
    } // End of func viewDidLoad()
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
    
        
    @IBAction func hiraganaButtonTapped(_ sender: UIButton) {
        // Performs modal segue to HiraganaViewController via Storyboard
    }
    @IBAction func katakanaButtonTapped(_ sender: UIButton) {
        // Performs modal segue to KatakanaViewController via Storyboard
    }
    @IBAction func kanjiButtonTapped(_ sender: UIButton) {
        // Performs modal segue to ComingSoonViewController via Storyboard
    }
    
} // End of class HomeViewController

