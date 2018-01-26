//
//  MyCartViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 9.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import SVProgressHUD
import SwiftyJSON


class MyCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buyItemsButton: CustomButton!
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var finalPriceLabel: UILabel!
    

    let username = UserDefaults.standard.string(forKey: "Username")
    let uid = Auth.auth().currentUser?.uid
    var finalPrice: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        itemsTableView.reloadData()
        updateFinalPriceLabel()

    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return DataService.instance.cartProductsArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell {

              let product = DataService.instance.cartProductsArray[indexPath.row]
              cell.setupView(product: product)
              return cell
        }
       
        return CartCell()

    }
    

    // Cell Animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.2, animations: {
            
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
            
        },completion: nil)
        
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            DataService.instance.cartProductsArray.remove(at: indexPath.row)
            itemsTableView.beginUpdates()
            
            itemsTableView.deleteRows(at: [indexPath], with: .automatic)
            
            itemsTableView.endUpdates()
            updateFinalPriceLabel()

        }
        
    }
    
    func updateFinalPriceLabel() {
        
        finalPrice = 0
        
        if DataService.instance.cartProductsArray.count != 0 {
            
            for product in DataService.instance.cartProductsArray {
                
                let productsPrice = Int(product.price)! * Int(product.productQuantity)
                finalPrice += productsPrice
                
            }
        }

        finalPriceLabel.text = "Total: \(finalPrice)$"
        
    }

    func putSelectedProductsInFirebase() {
        
        //Set order number
        
        var orderNumber = 1

        if let orderCount = UserDefaults.standard.value(forKey: "orderCount") as? Int {
         
            orderNumber = orderCount + 1
            UserDefaults.standard.setValue(orderNumber, forKey: "orderCount")

        } else {

            UserDefaults.standard.setValue(1, forKey: "orderCount")

        }
    
        // structure the items in a dict

        var productDict = [String: [String: String]]()
        for i in 0..<DataService.instance.cartProductsArray.count {
        
            let product = DataService.instance.cartProductsArray[i]
            var productData = [String: String]()
        
            productData["Product Name"] = product.title
            productData["Product Count"] = String(product.productQuantity)
            productData["Product Price"] = "\(product.price)$"
            productDict["Product \(i + 1)"] = productData
        
        }
    
        // post to Firebase Database

        let ref = Database.database().reference()
        ref.child("users").child(uid!).child("Username: \(username!)").child("Order \(orderNumber), Total: \(finalPrice) USD").setValue(productDict)
        
        SVProgressHUD.showSuccess(withStatus: "Items bought successfully!")
        SVProgressHUD.dismiss(withDelay: 1)
        
    }

    @IBAction func buyItemsTapped(_ sender: Any) {

        if DataService.instance.cartProductsArray.count != 0 {
            
            let alertController = UIAlertController(title: nil, message: "Confirm purchase?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in

            self.putSelectedProductsInFirebase()
            DataService.instance.cartProductsArray.removeAll()
            self.itemsTableView.reloadData()
            self.updateFinalPriceLabel()

            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (action) in
                
            })
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)

        } else {
            
            SVProgressHUD.showInfo(withStatus: "Your cart is empty!")
            SVProgressHUD.dismiss(withDelay: 1)

        }

    }
    
}






