//
//  Product.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 26.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import Foundation

class Product {
    
    var title: String
    var price: String
    var imageName: String
    var productQuantity = 1
    
    
    init(title: String, price: String, imageName: String, productQuantity: Int) {
        
        self.title = title
        self.price = price
        self.imageName = imageName
        self.productQuantity = productQuantity
        
    }
    
}


extension Product: Equatable {
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return
                lhs.imageName == rhs.imageName &&
                lhs.price == rhs.price &&
                lhs.imageName == rhs.imageName &&
                lhs.productQuantity == rhs.productQuantity
    }
    
}
