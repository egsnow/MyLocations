//
//  CustomTextField.swift
//  MyLocations
//
//  Created by Eric Snow on 6/18/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }

    
    
}
