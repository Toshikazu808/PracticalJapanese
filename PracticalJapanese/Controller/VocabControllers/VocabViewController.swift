//
//  VocabViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 9/1/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

class VocabViewController: UIViewController {

    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontCardImageView: UIImageView!
    @IBOutlet weak var backCardImageView: UIImageView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var cardSpeaker: UIImageView!
    @IBOutlet weak var shuffleButton: UIButton!
    var gestureRecognizers = GestureRecognizers()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listButton.alpha = 1
        
        cardStack = VocabCardStack().getCards()
        for i in 0..<cardStack.count {
            print(cardStack[i].cardName)
        }
        print("\n")
                
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        
        frontCardImageView.layer.cornerRadius = 15
        frontCardImageView.layer.borderWidth = 0
        frontCardImageView.alpha = 1
        frontCardImageView.isUserInteractionEnabled = true
        
        backCardImageView.layer.cornerRadius = 15
        backCardImageView.layer.borderWidth = 0
        backCardImageView.alpha = 0
        backCardImageView.isUserInteractionEnabled = true
//        frontCardImageView.superview?.bringSubviewToFront(frontCardImageView)
        checkImageView.alpha = 0
        cardSpeaker.alpha = 0
        cardSpeaker.isUserInteractionEnabled = true
        
//        backCardImageView.superview?.sendSubviewToBack(backCardImageView)
        
        let frontCardTapped = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        frontCardTapped.numberOfTapsRequired = 1
        frontCardImageView.addGestureRecognizer(frontCardTapped)
        let backCardTapped = UITapGestureRecognizer(target: self, action: #selector(resetStack))
        backCardTapped.numberOfTapsRequired = 1
        backCardImageView.addGestureRecognizer(backCardTapped)
        let cardSpeakerTapped = UITapGestureRecognizer(target: self, action: #selector(speakerTapped))
        cardSpeakerTapped.numberOfTapsRequired = 1
        cardSpeaker.addGestureRecognizer(cardSpeakerTapped)        
        
        if let shuffleButtonImage = UIImage(systemName: SystemImageNames.arrowTriangleCirclePath) {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
        } else if let shuffleButtonImage = UIImage(systemName: SystemImageNames.arrowCirclePath) {
            shuffleButton.setImage(shuffleButtonImage, for: .normal)
            print("SystemImage '\(SystemImageNames.arrowTriangleCirclePath)' is unavailable.")
            print("shuffleButton image set to '\(SystemImageNames.arrowCirclePath)' instead.")
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
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        K.viewControllerNumber = 0
        K.stackIndicator = 0
        K.showFront = true
        K.vocabStackSelection = 0
        K.stackTotal = 0
        // Reset the number of cards in the stack
        
        
        
    } // End of @IBAction func homeButtonTapped
    
    
    @objc func speakerTapped() {
        gestureRecognizers.tapForSound()
    } // End of func speakerTapped
    
    
    @objc func cardTapped() {
        backCardImageView.alpha = 0
        gestureRecognizers.flipCard(frontCardImageView: frontCardImageView, cardSpeaker: cardSpeaker)
    } // End of @objc func cardTapped
    
    
    @objc func resetStack() {
        cardStack = VocabCardStack().getCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        K.showFront = true
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
    
    
    @IBAction func shuffleButtonTapped(_ sender: UIButton) {
        cardStack = VocabCardStack().getCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        K.showFront = true
    } // End of @IBAction func shuffleButtonTapped
    
    
//    @IBAction func zButtonTapped(_ sender: UIButton) {
//
////        if front == true {
////            backCardImageView.superview?.bringSubviewToFront(backCardImageView)
////            frontCardImageView.superview?.sendSubviewToBack(frontCardImageView)
////            front = false
////        } else {
////            backCardImageView.superview?.sendSubviewToBack(backCardImageView)
////            frontCardImageView.superview?.bringSubviewToFront(frontCardImageView)
////            front = true
////        }
//
//        if front == true {
//            backView.superview?.bringSubviewToFront(backView)
//            frontView.superview?.sendSubviewToBack(frontView)
//            front = false
//        } else {
//            backView.superview?.sendSubviewToBack(backView)
//            frontView.superview?.bringSubviewToFront(frontView)
//            front = true
//        }
//        print(frontCardImageView.superview!)
//        print(backCardImageView.superview!)
//        print(backView.superview!)
//        print(frontView.superview!)
//        print(mainView.superview!)
//        print("\n")
//
//    } // End of zButtonTapped
    
    
    
} // End of class VocabViewController
