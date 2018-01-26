//
//  NavigationController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 26.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

@IBDesignable
class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Avenir Next", size: 21)!, NSAttributedStringKey.foregroundColor: UIColor.init(red: 107/255, green: 185/255, blue: 240/255, alpha: 0.9)]
      
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSAttributedStringKey.font: UIFont(name: "Avenir Next", size: 17)!, NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.8)], for: .normal)
        
    }

}
