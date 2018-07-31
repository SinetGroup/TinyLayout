//
//  ExampleVC.swift
//  EZLayout
//
//  Created by LookForward on 07/30/2018.
//  Copyright (c) 2018 LookForward. All rights reserved.
//

import UIKit
import EZLayout

class ExampleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let view = UIView()
        view.addTo(self.view).fill(self.view, withInsets: UIEdgeInsets(50))
        view.backgroundColor = .blue
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

