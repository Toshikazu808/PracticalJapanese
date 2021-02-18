//
//  VocabCollectionViewCell.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 2/16/21.
//  Copyright © 2021 Ryan Kanno. All rights reserved.
//

import UIKit

class VocabCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        print(self.bounds.height)
        print(self.bounds.width)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            contentView.leftAnchor.constraint(equalTo: leftAnchor),
//            contentView.rightAnchor.constraint(equalTo: rightAnchor),
//            contentView.topAnchor.constraint(equalTo: topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])

    } // End of awakeFromNib
      
} // End of class VocabCollectionViewCell
