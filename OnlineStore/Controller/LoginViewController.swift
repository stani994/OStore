//
//  LoginViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 23.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: EmailPassTextField!
    @IBOutlet weak var passTextField: EmailPassTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        emailTextField.delegate = self
        passTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewAnimationOpen()
        
        // Hide the navigation bar on this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        viewAnimationClose()
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case emailTextField:
            passTextField.becomeFirstResponder()
        case passTextField:
            passTextField.resignFirstResponder()
        default:
            return true
            
        }
        
        return true
        
    }
    
    
    func viewAnimationOpen() {
        
        loginView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        UIView.animate(withDuration: 0.3, animations: {
            
            self.loginView.layer.transform = CATransform3DMakeScale(1,1,1) },completion: nil)
        
    }
    
    
    func viewAnimationClose() {
        
        loginView.layer.transform = CATransform3DMakeScale(1, 1, 1)
        UIView.animate(withDuration: 0.3, animations: {
            
            self.loginView.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1) },completion: nil)
        
    }
    
    
    @IBAction func signInTapped(_ sender: CustomButton) {
        
        SVProgressHUD.show(withStatus: "Logging in...")
        
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text!)
        { (user, error) in
            
            if error != nil {
                
                print(error!)
                SVProgressHUD.showError(withStatus: "\(String(describing: error!.localizedDescription))")
                
            } else {
                
                //Success
                SVProgressHUD.showSuccess(withStatus: "Success!")
                SVProgressHUD.dismiss(withDelay: 0.6)
                
                let email = Auth.auth().currentUser?.email!
                let name = email!.components(separatedBy: CharacterSet(charactersIn: ("@0123456789"))).first
                
                UserDefaults.standard.set(name, forKey: "Username")
                
                self.performSegue(withIdentifier: "categoriesSegue", sender: self)
                
            }
            
        }
        
    }

    
    @IBAction func registerTapped(_ sender: CustomButton) {
        
        performSegue(withIdentifier: "registerSegue", sender: self)
        
    }
    
    @IBAction func testLoginTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "categoriesSegue", sender: self)
        
    }
}








