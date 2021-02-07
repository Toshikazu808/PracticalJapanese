//
//  VocabButtonCell.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 2/6/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import UIKit

class VocabButtonCell: UITableViewCell {
    
    @IBOutlet weak var buttonLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        self.selectionStyle = .none
        buttonLabel.layer.cornerRadius = 10
        buttonLabel.backgroundColor = UIColor.clear
        buttonLabel.textColor = UIColor.white
        buttonLabel.font = UIFont(name: "Copperplate", size: 30)
    } // End of func awakeFromNib
    
} // End of class VocabButtonCell
