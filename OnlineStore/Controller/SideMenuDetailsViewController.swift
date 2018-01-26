//
//  AboutUsViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 13.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit
import Firebase

class SideMenuDetailsViewController: UIViewController {

    enum SideMenuVCDetailsType: Int {
        
        case profile = 0
        case info = 1
        case aboutUs = 2
        
    }
    
    var type: SideMenuVCDetailsType!
   
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInfo()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(SideMenuDetailsViewController.swipeDown))
        swipe.direction = .down
        view.addGestureRecognizer(swipe)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SideMenuDetailsViewController.showHelpLabel))
        view.addGestureRecognizer(tap)
        
        helpLabel.alpha = 0
        
    }
    
    func setupInfo() {
        
        switch type! {
            
        case .profile:
            
            titleLabel.text = "Account"
            
            let username = UserDefaults.standard.string(forKey: "Username")!
            let email = Auth.auth().currentUser!.email!
            contentLabel.text = """
            Username: \(username)
            
            Email: \(email)
            """
            
        case .info:
            
            titleLabel.text = "Contact Us"
            contentLabel.text =             """
            CEO - Jo Store
            +359 883 888 321
            HR - Gerrard Bool
            +359 889 443 123
            Email - ostore@gmail.com
            """
            
        case .aboutUs:
            
            titleLabel.text = "About Us"
            contentLabel.text =             """
            We are the biggest clothes seller in the world founded in 2010. Our brand gained world recognition in the last couple of years through the professional customer service, large range of products, worldwide delivery and of course the passion of our team. Have fun shopping! :)
            """
            
        }
        
    }
    
    @objc func showHelpLabel() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.helpLabel.alpha = 1
        }, completion: { completed in
        
            UIView.animate(withDuration: 0.8, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.helpLabel.alpha = 0
            }, completion: nil)
            
        })
        
    }
    
    @objc func swipeDown() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

