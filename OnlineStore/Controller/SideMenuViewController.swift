//
//  SideMenuViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 7.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let menuItems = ["-  Account", "-  Contact Us", "-  About Us"]
    
    var menuItemTitle: String?
    var menuItemContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell
        
        let name = menuItems[indexPath.row]
        cell!.setupView(name: name)
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
            
        case 0:
            
            performSegue(withIdentifier: "SideMenuDetails", sender: indexPath.row)
            
        case 1:
            
            performSegue(withIdentifier: "SideMenuDetails", sender: indexPath.row)
            
        case 2:
            
            performSegue(withIdentifier: "SideMenuDetails", sender: indexPath.row)
            
        default:
            return
            
        }
        
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        do {
            
            try Auth.auth().signOut()
            SVProgressHUD.showSuccess(withStatus: "Logout Successful!")
            SVProgressHUD.dismiss(withDelay: 1)

            dismiss(animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            
            print(signOutError)
            SVProgressHUD.showError(withStatus: "\(signOutError.localizedDescription)")
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? SideMenuDetailsViewController {
            
            destinationVC.type = SideMenuDetailsViewController.SideMenuVCDetailsType(rawValue: sender as! Int)
            
        }
        
    }

}
