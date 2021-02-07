//
//  VocabSelectionViewController.swift
//  PracticalJapanese
//
//  Created by Ryan Kanno on 9/1/20.
//  Copyright © 2020 Ryan Kanno. All rights reserved.
//

import UIKit


class VocabSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var card = Cards()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.buttonCellNibName, bundle: nil), forCellReuseIdentifier: K.buttonCellIdentifier)
        tableView.isUserInteractionEnabled = true
        tableView.layer.cornerRadius = 5
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
        K.viewControllerNumber = 0
        K.stackIndicator = 0
        K.showFront = true
        K.vocabStackSelection = 0
        K.stackTotal = 0
    } // End of func homeButtonTapped
    

} // End of class VocabViewController


extension VocabSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return K.vocabButtonSelection.count
    } // End of numberOfSections
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    } // End of numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    } // End of heightForHeaderInSection
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        // Find height of the tableView
        let cellHeight = screenSize.height / 14
        return cellHeight
    } // End of heightForRowAt
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    } // End of viewForHeaderInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = K.vocabButtonSelection[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.buttonCellIdentifier, for: indexPath) as! VocabButtonCell
        cell.buttonLabel?.text = content
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    } // End of cellForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Colors stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.colorStack.count
        case 1:
            print("Animals stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.animalStack.count
        case 2:
            print("Ocean Animals stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.oceanAnimalStack.count
        case 3:
            print("Nature stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.natureStack.count
        case 4:
            print("Bugs stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.bugStack.count
        case 5:
            print("Vegetables stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.vegetableStack.count
        case 6:
            print("Fruits stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.fruitStack.count
        case 7:
            print("House stack tapped")
            K.vocabStackSelection = indexPath.section
            K.stackTotal = K.houseStack.count
        default:
            print("Unregistered selection")
            break
        }
        performSegue(withIdentifier: "toVocabVC", sender: nil)
    } // End of didSelectRowAt
    
} // End of extension VocabSelectionViewController
