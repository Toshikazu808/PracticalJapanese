//
//  KanjiFileViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/16/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class KanjiSelectionViewController: UIViewController {

    
    @IBOutlet var levelButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<levelButtons.count {
            levelButtons[i].layer.cornerRadius = 15
            levelButtons[i].layer.borderWidth = 0
            levelButtons[i].alpha = 1
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
    
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        Constants.viewControllerNumber = 0
        Cards().kanjiLevel = 0
    }
    
    
    @IBAction func levelButtonsTapped(_ sender: UIButton) {
        // All level buttons included in this @IBAction
        switch sender.tag {
        case 0:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        case 1:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        case 2:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        case 3:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        case 4:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        case 5:
            print("Button \(sender.tag + 1) tapped")
            Cards().kanjiLevel = sender.tag + 1
            
        default:
            print("Selection not available.")
        }
        
    } // End of @IBAction func levelButtonsTapped
    

} // End of class KanjiSelectionViewController
