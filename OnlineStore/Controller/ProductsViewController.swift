//
//  ProductsViewController.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 16.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var products = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self

        
    }
    
    func initProducts(category: Category) {
        
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            
            let product = products[indexPath.row]
            cell.setupView(product: product)
            return cell
            
        }
        
        return ProductCell()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: selectedProduct )
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: (self.productsCollectionView.frame.size.width - 30)/2, height: self.productsCollectionView.frame.size.height/2)
        
        
    }
    
    // Cell Animation
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.2, animations: {
            
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
            
        },completion: nil)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailsVC = segue.destination as? DetailsViewController {
            
            detailsVC.selectedProduct = sender as? Product
            
        }
        
    }
    
}
