//
//  SampleViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 12/20/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var counter:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
    

    @IBAction func pressMeButtonTapped(_ sender: UIButton) {
        
        
        counter += 1
        helloLabel.text = "\(counter)"

        print(counter)
        
    }
    
    
    
    
}
