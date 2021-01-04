//
//  ViewController.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var buttonBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = startButton.bounds.height/2
        startButton.layer.masksToBounds = true
        buttonBackground.layer.cornerRadius = startButton.bounds.height/2
        buttonBackground.layer.shadowColor = UIColor.black.cgColor
        buttonBackground.layer.shadowOpacity = 0.2;
        buttonBackground.layer.shadowRadius = 5.0;
        buttonBackground.layer.shadowOffset = CGSize(width: 0.0, height: 5.0);
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
//        UITabBar.appearance().tintColor = UIColor(red: 185/255.0, green: 160/255.0, blue: 137/255.0, alpha: 1)
    }


}

