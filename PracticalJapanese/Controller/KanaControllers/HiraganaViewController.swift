//
//  HiraganaViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/9/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class HiraganaViewController: UIViewController {
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontCardImageView: UIImageView!
    @IBOutlet weak var backCardImageView: UIImageView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var cardSpeaker: UIImageView!
    @IBOutlet weak var shuffleAllButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    var gestureRecognizers = GestureRecognizers()
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.viewControllerNumber = 1
        Constants.stackIndicator = Cards().basicStack
        
        cardStack =  HiraganaKatakanaCardStacks().getCards()
        for i in 0..<cardStack.count {
            print(cardStack[i].cardName)
        }
        print("\n")
        
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        
        frontCardImageView.layer.cornerRadius = 15
        frontCardImageView.layer.borderWidth = 0
        frontCardImageView.isUserInteractionEnabled = true
        
        backCardImageView.layer.cornerRadius = 15
        backCardImageView.layer.borderWidth = 0
        backCardImageView.isUserInteractionEnabled = true
        
        backCardImageView.alpha = 0
        checkImageView.alpha = 0
        cardSpeaker.alpha = 0
        cardSpeaker.isUserInteractionEnabled = true
        
        let frontCardTapped = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        frontCardTapped.numberOfTapsRequired = 1
        frontCardImageView.addGestureRecognizer(frontCardTapped)
        let backCardTapped = UITapGestureRecognizer(target: self, action: #selector(resetStack))
        backCardTapped.numberOfTapsRequired = 1
        backCardImageView.addGestureRecognizer(backCardTapped)
        let cardSpeakerTapped = UITapGestureRecognizer(target: self, action: #selector(speakerTapped))
        cardSpeakerTapped.numberOfTapsRequired = 1
        cardSpeaker.addGestureRecognizer(cardSpeakerTapped)
        
        shuffleAllButton.alpha = 1
        
        if let shuffleButtonImage = UIImage(systemName: SystemImageNames.arrowTriangleCirclePath) {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
        } else if let shuffleButtonImage = UIImage(systemName: SystemImageNames.arrowCirclePath) {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
            print("SystemImage '\(SystemImageNames.arrowTriangleCirclePath)' is unavailable.")
            print("shuffleButton image set to '\(SystemImageNames.arrowCirclePath)' instead.")
        }
        
        // Allows for custom transition animations
        //transitioningDelegate = self
        
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
        Constants.stackIndicator = 0
        Constants.showFront = true
        Constants.vocabStackSelection = 0
        Constants.stackTotal = 0
    } // End of func homeButtonTapped
    
    
    @objc func speakerTapped() {
        gestureRecognizers.tapForSound()
    } // End of func speakerTapped
    
    
    @objc func cardTapped() {
        backCardImageView.alpha = 0
        gestureRecognizers.flipCard(frontCardImageView: frontCardImageView, cardSpeaker: cardSpeaker)
    } // End of func cardTapped
    
    
    @objc func resetStack() {
        cardStack = HiraganaKatakanaCardStacks().getCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        Constants.showFront = true
        checkImageView.alpha = 0
        backCardImageView.alpha = 0
        frontView.center = CGPoint(x: view.center.x, y: view.center.y)
        UIView.animate(withDuration: 0.0, animations: {
            self.frontView.center = self.view.center
        })
    } // End of func resetStack
    
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let sender = sender
        let card:UIView = sender.view!
        let point:CGPoint = sender.translation(in: view)
        let xFromCenter:CGFloat = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        gestureRecognizers.panSetImageCheckOrX(xFromCenter: xFromCenter, checkImageView: checkImageView, backCardImageView: backCardImageView, view: view)
        // NOTE: panSetImageCheckOrX must come before panMoveOffScreen
        gestureRecognizers.panMoveOffScreen(sender: sender, card: card, view: view, checkImageView: checkImageView, frontCardImageView: frontCardImageView, backCardImageView: backCardImageView, cardSpeaker: cardSpeaker)
    } // End of @IBAction func panGesture
    
        
    @IBAction func buttonSelection(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            Constants.stackIndicator = Cards().basicStack
        case 2:
            Constants.stackIndicator = Cards().tentenStack
        case 3:
            Constants.stackIndicator = Cards().comboStack
        case 4:
            cardStack =  HiraganaKatakanaCardStacks().getCards()
        default:
            break
        }
        cardStack =  HiraganaKatakanaCardStacks().getCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        Constants.showFront = true
    } // End of @IBAction func buttonSelection

    
    @IBAction func shuffleAllTapped(_ sender: UIButton) {
        cardStack = HiraganaKatakanaCardStacks().getAllCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        print(cardStack[0].soundName)
        Constants.showFront = true
    } // End of func shuffleAllTapped
    
    
} // End of class HiraganaViewController





//extension HiraganaViewController: UIViewControllerTransitioningDelegate {
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return TransitionAnimations(animationDuration: 1.5, animationType: .presentTutorial)
//    }
//
////    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
////        return TransitionAnimations(animationDuration: 3.5, animationType: .dismissTutorial)
////    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return TransitionAnimations(animationDuration: 1.5, animationType: .dismissFlipHorizontal)
//    }
//
//
//
//
//} // End of extension
