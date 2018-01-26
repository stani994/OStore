//
//  LoginRegButton.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 16.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        
        customizeView()
        
    }

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        customizeView()
        
    }
    
    func customizeView() {
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.4196078431, green: 0.7254901961, blue: 0.9411764706, alpha: 1)
        
    }
        
}
