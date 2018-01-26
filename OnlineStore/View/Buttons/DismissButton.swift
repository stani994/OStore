//
//  DismissButton.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 26.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit

@IBDesignable

class DismissButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        
        customizeView()
        
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        customizeView()
        
    }
    
    func customizeView() {
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
}
