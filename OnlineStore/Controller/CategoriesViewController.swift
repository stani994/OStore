//
//  ViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 16.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import SWRevealViewController

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var VCisON: Bool = true
    
    
    let imageView: UIImageView? = nil
    @IBOutlet weak var categoryTable: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Add button custom view
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "menu-button"), for: UIControlState.normal)
        button.frame = CGRect(x: 0,y: 0,width: 33,height: 30)
        button.widthAnchor.constraint(equalToConstant: 33.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        menuBtn.customView = button
        
        button.addTarget(self, action: #selector(self.menuBtnTapped), for: .touchUpInside)
        button.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        categoryTable.delegate = self
        categoryTable.dataSource = self
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataService.instance.getCategories().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.setupView(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        categoryTable.deselectRow(at: indexPath, animated: true)
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "productsSegue", sender: category)
        
    }
    
    
    @objc func menuBtnTapped(sender: UIButton) {
        
        
        if VCisON {
            
            UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.menuBtn.customView?.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0,0,1)
                sender.setImage(UIImage(named: "close"), for: UIControlState.normal)
                
            }, completion: nil)
            
            VCisON = false
            categoryTable.allowsSelection = false

        } else {
            
            UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.menuBtn.customView?.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0,0,0)
                sender.setImage(UIImage(named: "menu-button"), for: UIControlState.normal)
                
            }, completion: nil)
            
            VCisON = true
            categoryTable.allowsSelection = true

        }
        
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let productsVC = segue.destination as? ProductsViewController {
            
            assert(sender as? Category != nil) 
            productsVC.initProducts(category: sender as! Category)
            
        }
        
    }
    

}

