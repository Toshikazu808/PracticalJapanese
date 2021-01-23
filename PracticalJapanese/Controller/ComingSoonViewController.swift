//
//  ComingSoonViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/15/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class ComingSoonViewController: UIViewController {
    
    @IBOutlet weak var thankYouImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thankYouImageView.layer.cornerRadius = 10
        thankYouImageView.layer.borderWidth = 0
        thankYouImageView.isUserInteractionEnabled = false
        thankYouImageView.alpha = 1
        
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
        // Performs modal segue to HomeViewController via Storyboard
        dismiss(animated: true, completion: nil)
    }

} // End of class ComingSoonViewController
