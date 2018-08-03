//
//  RootVC.swift
//  TinyLayout_Example
//
//  Created by LookForward on 07/31/2018.
//  Copyright © 2018 SinetGroup. All rights reserved.
//

import UIKit

class RootVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [SimpleVC()]
    }
}
