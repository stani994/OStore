//
//  CartCell.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 9.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemsQuantity: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
        
    }
    
    func setupView(product: Product) {
        
        itemImage.image = UIImage(named: product.imageName)
        itemNameLabel.text = product.title
        itemPriceLabel.text = "Price: \(product.price)$"
        itemsQuantity.text = String("Pieces: \(product.productQuantity)")
        
    }

}
