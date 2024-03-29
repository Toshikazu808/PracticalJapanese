//
//  TransitionAnimations.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 7/16/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit

class TransitionAnimations: NSObject {
    
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType {
        case presentTutorial
        case dismissTutorial
        case dismissFlipHorizontal
    }
    
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
    
} // End of class TransitionAnimations


extension TransitionAnimations: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    } // End of func
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch animationType {
        case .presentTutorial:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        
        case .dismissTutorial:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
            
        case .dismissFlipHorizontal:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissFlipHorizontalAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
            
        } // End of switch
     
    } // End of func animateTransition
    
    
    func dismissFlipHorizontalAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.3, options: .transitionFlipFromRight, animations: {
            // Include animations here
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    } // End of func dismissFlipHorizontal
    
    
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        let duration = transitionDuration(using: transitionContext)
        let scaleDown = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let moveOut = CGAffineTransform(translationX: -viewToAnimate.frame.width, y: 0)
        
        //MARK: - TUTORIAL DISMISS animation block
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7) {
                viewToAnimate.transform = scaleDown
            }
            UIView.addKeyframe(withRelativeStartTime: 3.0/duration, relativeDuration: 1.0) {
                viewToAnimate.transform = scaleDown.concatenating(moveOut)
                viewToAnimate.alpha = 0
            }
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    } // End of func dismissAnimation
    
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0) // Values between 0 - 1 (They're % based)
        
        let duration = transitionDuration(using: transitionContext)
        
        //MARK: - TUTORIAL PRESENT animation block
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    } // Enf of func presentAnimation
    
} // End of extention
