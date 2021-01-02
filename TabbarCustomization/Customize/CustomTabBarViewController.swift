//
//  CustomTabBarViewController.swift
//  TabbarCustomization
//
//  Created by Prasad on 1/1/21.
//

import UIKit

let kBarHeight: CGFloat = 80.0;

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.frame.size.height = kBarHeight
        tabBar.frame.origin.y = view.frame.height - kBarHeight
    }
}
