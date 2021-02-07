//
//  SettingsViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/30/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var onButton: UIButton!
    @IBOutlet weak var offButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if soundOn == true {
            onButton.setTitleColor(.white, for: .normal)
            offButton.setTitleColor(.darkGray, for: .normal)
        } else {
            onButton.setTitleColor(.darkGray, for: .normal)
            offButton.setTitleColor(.white, for: .normal)
        }
    } // Enf of viewDidLoad()
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
    
    
    @IBAction func backArrowTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onButtonTapped(_ sender: UIButton) {
        soundOn = true
        onButton.setTitleColor(.white, for: .normal)
        offButton.setTitleColor(.darkGray, for: .normal)
    }
    @IBAction func offButtonTapped(_ sender: UIButton) {
        soundOn = false
        onButton.setTitleColor(.darkGray, for: .normal)
        offButton.setTitleColor(.white, for: .normal)
    }
    

} // End of class SettingsViewController
