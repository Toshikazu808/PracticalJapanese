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
    @IBOutlet weak var collectionView: UICollectionView!
    var gestureRecognizers = GestureRecognizers()
    var selectionContent:[CollectionCellViewContent] = []
    
    
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
        
        for i in 0..<K.collectionViewCellImageNames.count {
            let cellContent = CollectionCellViewContent(selectionLabel: K.collectionViewCellLabelNames[i], selectionImage: UIImage(named: "\(K.collectionViewCellImageNames[i])")!)
            selectionContent.append(cellContent)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: K.collectionCellNibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: K.collectionCellNibName)
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceHorizontal = true
        
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
    
} // End of class VocabViewController


extension VocabViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.collectionViewCellImageNames.count
    } // End of numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let content = selectionContent[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCellNibName, for: indexPath) as! VocabCollectionViewCell
        cell.imageLabel?.text = content.selectionLabel
        cell.imageView?.image = content.selectionImage
        return cell
    } // End of cellForItemAt
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell tapped: \(indexPath.row)")
        switch indexPath.row {
        case 0:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.colorStack.count
        case 1:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.animalStack.count
        case 2:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.oceanAnimalStack.count
        case 3:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.natureStack.count
        case 4:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.bugStack.count
        case 5:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.vegetableStack.count
        case 6:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.fruitStack.count
        case 7:
            K.vocabStackSelection = indexPath.row
            K.stackTotal = K.houseStack.count
        default:
            print("Unregistered selection")
            break
        }
        cardStack = VocabCardStack().getCards()
        frontCardImageView.image = UIImage(named: cardStack[0].cardName)
        backCardImageView.image = UIImage(named: cardStack[1].cardName)
        K.showFront = true
    } // End of didSelectItemAt
    
} // End of extension UICollectionViewDelegate & UICollectionViewDataSource


//extension VocabViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("\nsizeForItemAt called")
//
////        let screenSize: CGSize = UIScreen.main.bounds.size
////        let cellHeight = floor(screenSize.height * cellScale)
////        let cellWidth = floor(screenSize.width * cellScale)
////        let cellWidth = collectionView.frame.size.width / 3.5
////        let cellHeight = collectionView.frame.size.height
//        
//        let collectionViewSize: CGSize = collectionView.bounds.size
//        let cellHeight = collectionViewSize.height * 0.8
//        let cellWidth = collectionViewSize.width * 0.2
//        print(collectionViewSize)
////        let paddingSpace = sectionInsets.left
////        let availableWidth = view.frame.width - paddingSpace
////        let widthPerItem = availableWidth / 3.5
//
//        return CGSize(width: cellWidth, height: cellHeight)
//    } // End of sizeForItemAt
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let screenSize: CGSize = UIScreen.main.bounds.size
//        let cellHeight = floor(screenSize.height * cellScale)
//        let cellWidth = floor(screenSize.width * cellScale)
//        let insetX = (view.bounds.width - cellWidth) / 2.0
//        let insetY = (view.bounds.height - cellHeight) / 2.0
//        return UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
//    }
//
//} // End of extension UICollectionViewDelegateFlowLayout
