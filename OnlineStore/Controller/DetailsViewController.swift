//
//  DetailsViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 6.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailsViewController: UIViewController {

    @IBOutlet weak var addToCartButton: CustomButton!

    @IBOutlet weak var popupDetailsView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!

    var selectedProduct: Product?

    override func viewDidLoad() {

        super.viewDidLoad()
        
        popupDetailsView.layer.cornerRadius = 12
        
        productImage.image = UIImage(named: selectedProduct!.imageName)
        productName.text = selectedProduct!.title
        productPrice.text = "Price: \(selectedProduct!.price)$"

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UIApplication.shared.isStatusBarHidden = true
        viewOpenAnimation()
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        UIApplication.shared.isStatusBarHidden = false
        viewCloseAnimation()
                
    }
    
    
    func viewOpenAnimation() {
        
        view.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        UIView.animate(withDuration: 0.2, animations: { self.view.layer.transform = CATransform3DMakeScale(1,1,1) },completion: nil)
        
    }


    func viewCloseAnimation() {

        view.layer.transform = CATransform3DMakeScale(1, 1, 1)
        UIView.animate(withDuration: 0.2, animations: { self.view.layer.transform = CATransform3DMakeScale(0.1,0.1,0.1) },completion: nil)

    }
    
    
    @IBAction func addToCartTapped(_ sender: CustomButton) {
        
        if DataService.instance.cartProductsArray.contains(where: { $0 == selectedProduct! }) {
            // found
            
            selectedProduct!.productQuantity += 1
            print("product quantity: \(selectedProduct!.productQuantity)")
            print(selectedProduct!)
            
        } else {
            // not found
            
            DataService.instance.cartProductsArray.append(selectedProduct!)
            
        }
        
        SVProgressHUD.showSuccess(withStatus: "Item Added to Cart!")
        SVProgressHUD.dismiss(withDelay: 0.7)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func dismissTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    
}
