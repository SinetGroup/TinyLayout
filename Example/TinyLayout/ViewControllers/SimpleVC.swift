//
//  SimpleVC.swift
//  TinyLayout_Example
//
//  Created by LookForward on 31.07.2018.
//  Copyright © 2018 SinetGroup. All rights reserved.
//

import UIKit
import TinyLayout

class SimpleVC: UIViewController {
    
    private lazy var blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.title = "Simple"
        self.view.backgroundColor = .white

        self.blackView.backgroundColor = .black
        self.blackView.addTo(self.view).size(equalTo: 100).top(to: self.view.top, constant: 25).right(to: self.view.right, constant: 45)

        ExampleLabel(".fill(self.view, withInsets: UIEdgeInsets(all: 50))").addTo(self.blackView).fill(self.blackView, withInsets: UIEdgeInsets(all: 5))
        
        print(self.blackView.constraint(for: .height)?.constant)
        print(self.blackView.constraint(for: .right)?.constant)
    }
}
