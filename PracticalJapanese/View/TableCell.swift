//
//  TableCell.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 1/24/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var japaneseTextView: UIView!
    @IBOutlet weak var japaneseTextLabel: UILabel!
    @IBOutlet weak var englishTextView: UIView!
    @IBOutlet weak var englishTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardImageView.layer.cornerRadius = 5
        japaneseTextView.roundTopCorners(cornerRadius: 5)
        japaneseTextLabel.roundTopCorners(cornerRadius: 5)
        englishTextView.roundBottomCorners(cornerRadius: 5)
        englishTextLabel.roundBottomCorners(cornerRadius: 5)
        japaneseTextLabel.font = UIFont(name: "Hiragino Mincho ProN", size: 26)
        englishTextLabel.font = UIFont(name: "Verdana", size: 18)
    } // End of func awakeFromNib
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure view for selected state
    } // End of func setSelected
    
} // End of class TableCell


extension UIView {
    
    func roundTopCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    } // End of func roundCorners
    
    func roundBottomCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    } // End of func roundBottomCorners
    
} // End of extension UIView
