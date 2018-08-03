//
//  ExampleLabel.swift
//  TinyLayout_Example
//
//  Created by LookForward on 31.07.2018.
//  Copyright © 2018 SinetGroup. All rights reserved.
//

import UIKit

class ExampleLabel: UILabel {
    
    init(_ text: String, color: UIColor = .white) {
        super.init(frame: CGRect())
        self.text = text
        self.textColor = color
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
