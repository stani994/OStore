//
//  ProductCell.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 26.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        
    }
    
    func setupView(product: Product) {
        
        productImage.image = UIImage(named: product.imageName)
        productName.text = product.title
        productPrice.text = "\(product.price)$"
        
    }
}
