//
//  ViewController.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
//        UITabBar.appearance().tintColor = UIColor(red: 185/255.0, green: 160/255.0, blue: 137/255.0, alpha: 1)
    }


}

