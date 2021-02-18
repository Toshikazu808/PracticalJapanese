//
//  GestureRecognizers.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/13/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit
import AVFoundation

struct GestureRecognizers {
    
    var timer = Timer()
    var soundFile: AVAudioPlayer?

 
    mutating func panSetImageCheckOrX(xFromCenter: CGFloat, checkImageView: UIImageView, backCardImageView: UIImageView, view:UIView) -> Void {
        if xFromCenter > 0 {
            checkImageView.image = UIImage(systemName: "checkmark.circle")
            checkImageView.tintColor = UIColor.systemIndigo
        } else {
            checkImageView.image = UIImage(systemName: "x.circle")
            checkImageView.tintColor = UIColor.systemIndigo
        }
        checkImageView.alpha = abs(xFromCenter) / view.center.x
        backCardImageView.alpha = abs(xFromCenter) / view.center.x
    } // End of func panSetImageCheckOrX
    
    
    mutating func panMoveOffScreen(sender: UIPanGestureRecognizer, card: UIView, view: UIView, checkImageView: UIImageView, frontCardImageView: UIImageView,  backCardImageView: UIImageView, cardSpeaker: UIImageView) -> Void {
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 75 {
                // Move off to the LEFT SIDE of the screen
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 400, y: card.center.y + 75)
                }
                //MARK: - UIImage Recycler Section
                cardStack.append(cardStack[0])
                cardStack.remove(at: 0)
                for i in 0...cardStack.count - 1 {
                    print(cardStack[i].cardName)
                }
                print("\n")
                checkImageView.alpha = 0
                cardSpeaker.alpha = 0
                
                timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { (timer) in
                    // Change frontCardImage to the same as the backCardImage
                    frontCardImageView.image = UIImage(named: cardStack[0].cardName)
                    card.center = CGPoint(x: view.center.x, y: view.center.y)
                    backCardImageView.image = UIImage(named: cardStack[1].cardName)
                })
                K.showFront = true
                return
            } else if card.center.x > (view.frame.width - 75) {
                // Move off to the RIGHT SIDE of the screen
                if cardStack.count > 2 /* When you let go */ {
                    UIView.animate(withDuration: 0.3) {
                        card.center = CGPoint(x: card.center.x + 400, y: card.center.y + 75)
                    }
                    cardStack.remove(at: 0)
                    for i in 0...cardStack.count - 1 {
                        print(cardStack[i].cardName)
                    }
                    print("\n")
                    checkImageView.alpha = 0
                    cardSpeaker.alpha = 0
                    
                    timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { (timer) in
                        // Change frontCardImage to the same as the backCardImage
                        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
                        card.center = CGPoint(x: view.center.x, y: view.center.y)
                        
                        if cardStack.count > 2 {
                            backCardImageView.image = UIImage(named: cardStack[1].cardName)
                        } else {
                            backCardImageView.image = UIImage(named: "FinalCard")
                        }
                    })
                    K.showFront = true
                    return
                } else if cardStack.count == 2 {
                    UIView.animate(withDuration: 0.3) {
                        card.center = CGPoint(x: card.center.x + 400, y: card.center.y + 75)
                    }
                    cardStack.remove(at: 0)
                    checkImageView.alpha = 0
                    cardSpeaker.alpha = 0
                    K.showFront = true
                    return
                }
                // End of if else CARD MOVED LEFT OR RIGHT
            } else /* If card doesn't get swipped off screen */ {
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = view.center
                    checkImageView.alpha = 0
                    backCardImageView.alpha = 0
                })
            }
        } // End of sender.state == .ended
    } // End of func panMoveOffScreen
    
    
    mutating func flipCard(frontCardImageView: UIImageView, cardSpeaker: UIImageView) -> Void {
        if K.showFront == true {
            let image = UIImage(named: "\(cardStack[0].cardBack)")
            frontCardImageView.image = image
            UIView.transition(with: frontCardImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            timer = Timer.scheduledTimer(withTimeInterval: 0.127, repeats: false, block: { (timer) in
                cardSpeaker.alpha = 1
            })
            K.showFront = false
        } else {
            let image = UIImage(named: "\(cardStack[0].cardName)")
            frontCardImageView.image = image
            UIView.transition(with: frontCardImageView, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            timer = Timer.scheduledTimer(withTimeInterval: 0.127, repeats: false, block: { (timer) in
                cardSpeaker.alpha = 0
            })
            K.showFront = true
        }
    } // End of func flipCards
    
    
    mutating func tapForSound() -> Void {
        let url = Bundle.main.url(forResource: cardStack[0].soundName, withExtension: "m4a")
        guard url != nil else { return }
        do {
            soundFile = try AVAudioPlayer(contentsOf: url!)
            soundFile?.play()
        } catch {
            print("\nError playing sound \(error)")
        }
    } // End of func tapForSound
    
    
} // End of struct GestureRecognizers
