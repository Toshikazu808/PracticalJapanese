//
//  ThankYouViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 1/19/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var thankYouImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thankYouImage.layer.cornerRadius = 10
        thankYouImage.layer.borderWidth = 0
        thankYouImage.isUserInteractionEnabled = false
        thankYouImage.alpha = 1
        
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
    }
    
} // End of class ThankYouViewController
