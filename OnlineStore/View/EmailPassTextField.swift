//
//  EmailPassTextField.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 24.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

@IBDesignable

class EmailPassTextField: UITextField {
    
    override func prepareForInterfaceBuilder() {
        
        customizeView()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeView()
        
    }
    
    func customizeView() {
        
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder!, attributes:[NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.3)])
        
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        border.frame = CGRect(x: 0, y: self.bounds.size.height - width, width:  self.bounds.size.width, height: self.bounds.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
    

}
