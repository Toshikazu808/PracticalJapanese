//
//  KanjiViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/9/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class KanjiViewController: UIViewController {

    @IBOutlet weak var frontCardImageView: UIImageView!
    @IBOutlet weak var backCardImageView: UIImageView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var shuffleButton: UIButton!
    //    var swipeConstants = SwipeConstants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constants.viewControllerNumber = 3
        
        frontCardImageView.layer.cornerRadius = 10
        frontCardImageView.layer.borderWidth = 0
        frontCardImageView.isUserInteractionEnabled = true
        
        backCardImageView.layer.cornerRadius = 10
        backCardImageView.layer.borderWidth = 0
        backCardImageView.isUserInteractionEnabled = true
        
        backCardImageView.alpha = 0
        checkImageView.alpha = 0
        
        let frontCardTapped = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        frontCardTapped.numberOfTapsRequired = 1
        frontCardImageView.addGestureRecognizer(frontCardTapped)
        
        if let shuffleButtonImage = UIImage(systemName: "arrow.triangle.2.circlepath") {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
        } else if let shuffleButtonImage = UIImage(systemName: "arrow.2.circlepath") {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
            print("SystemImage 'arrow.triangle.2.circlepath' is unavailable.")
            print("shuffleButton image set to 'arrow.2.circlepath' instead.")
        }
        
    } // End of viewDidLoad()
    
    
    @objc func flipCard(_ sender: UITapGestureRecognizer) {
        //TODO: change flashcard stack to different images
        if Constants.showFront == true {
            let image = UIImage(named: "Zkanji0reading")
            frontCardImageView.image = image
            UIView.transition(with: frontCardImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            Constants.showFront = false
        } else {
            let image = UIImage(named: "Zkanji0")
            frontCardImageView.image = image
            UIView.transition(with: frontCardImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            Constants.showFront = true
        }
    } // End of func flipCard
    

    
    @IBAction func topPanGesture(_ sender: UIPanGestureRecognizer) {
        panGestureSwipe(sender)
        
    } // End of @IBAction func panGesture
    
    
    //MARK: - SWIPE RECYCLE FLOW
    /*
     1. User swipes card left or right, and card animates to continue off screen after reaching 75 points away from the edge.
     2. Bottom card becomes visible while top card is getting swipped away
     
     3. Top card gets RECYCLED and "becomes bottom card" by becoming invisible AND repositions to the center when panGestureRecognizer for bottom card begins
     4. RECYCLED card chooses random image from Hiragana stack
        
        NOTE: might need to use UICollectionView in order to access the dequeReusableCell function and the prepareForReuse functions
     
     
     
     */
    
    
    
    
    func panGestureSwipe(_ sender: UIPanGestureRecognizer) {
        
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if xFromCenter > 0 {
            checkImageView.image = UIImage(systemName: "checkmark.circle")
            checkImageView.tintColor = UIColor.systemIndigo
        } else {
            checkImageView.image = UIImage(systemName: "x.circle")
            checkImageView.tintColor = UIColor.systemIndigo
        }
        
        checkImageView.alpha = abs(xFromCenter) / view.center.x
        backCardImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == .ended {
            if card.center.x < 75 {
                // Move off to the left side of the screen
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                }
                return
            } else if card.center.x > (view.frame.width - 75) {
                // Move off to the right side of the screen
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                }
                return
            }
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                self.checkImageView.alpha = 0
            }
        } // End of sender.state == .ended
        
    } // End of func panGestureSwipe
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func hiraganaButtonTapped(_ sender: UIButton) {
        // Performs modal segue to HiraganaViewController via Storyboard
    }
    @IBAction func katakanaButtonTapped(_ sender: UIButton) {
        // Performs modal segue to KatakanaViewController via Storyboard
    }
    
    
    @IBAction func reviewButtonTapped(_ sender: UIButton) {
        
        
        
    } 
    @IBAction func shuffleButtonTapped(_ sender: UIButton) {
        
        
        
    }
    
} // End of class KanjiViewController
