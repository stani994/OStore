//
//  RegisterViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 24.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var emailField: EmailPassTextField!
    @IBOutlet weak var passwordField: EmailPassTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UIApplication.shared.isStatusBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        UIApplication.shared.isStatusBarHidden = false
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case emailField:
            passwordField.becomeFirstResponder()
        case passwordField:
            passwordField.resignFirstResponder()
        default:
            return true
        
        }
        
        return true
        
    }
    
    
    @IBAction func registerButtonTapped(_ sender: CustomButton) {
        
        SVProgressHUD.show(withStatus: "Registering...")
        
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            
            if error != nil {
                
                print(error!)
                SVProgressHUD.showError(withStatus: "\(String(describing: error!.localizedDescription))")
                
            }
            else {
             
                // success
                SVProgressHUD.showSuccess(withStatus: "Registration Successful!")
                SVProgressHUD.dismiss(withDelay: 1)
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
