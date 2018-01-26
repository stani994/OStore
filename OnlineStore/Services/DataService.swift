//
//  DataService.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 25.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    var cartProductsArray = [Product]()
    
    let categories = [
        
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "JACKETS", imageName: "digital.png"),
        Category(title: "JEANS", imageName: "jeans.png")
        
    ]
    
    let hats = [
        
        Product(title: "Winter Plain Hat Red", price: "15", imageName: "hat01.png", productQuantity: 1),
        Product(title: "Winter Plain Hat Blue", price: "15", imageName: "hat02.png", productQuantity: 1),
        Product(title: "Summer Plain Hat Green", price: "10", imageName: "hat03.png", productQuantity: 1),
        Product(title: "Summer Plain Hat Red", price: "15", imageName: "hat04.png", productQuantity: 1),
        Product(title: "Summer Plain Hat Blue", price: "15", imageName: "hat05.png", productQuantity: 1)

    ]
    
    let hoodies = [
        
        Product(title: "Nike Logo Hoodie Red", price: "40", imageName: "hoodie01.png", productQuantity: 1),
        Product(title: "Nike Logo Hoodie Blue", price: "40", imageName: "hoodie02.png", productQuantity: 1),
        Product(title: "Nike Logo JustDoIt Hoodie Blue", price: "55", imageName: "hoodie03.png", productQuantity: 1),
        Product(title: "Nike Logo JustDoIt Hoodie Black", price: "55", imageName: "hoodie04.png", productQuantity: 1)
        
    ]
    
    let shirts = [
        
        Product(title: "Round Neck Shirt Blue", price: "18", imageName: "shirt01.png", productQuantity: 1),
        Product(title: "Round Neck Shirt Red", price: "18", imageName: "shirt02.png", productQuantity: 1),
        Product(title: "Round Neck Shirt Black", price: "18", imageName: "shirt03.png", productQuantity: 1),
        Product(title: "Round Neck Shirt Green", price: "18", imageName: "shirt04.png", productQuantity: 1),
        Product(title: "Polo Shirt Light Green", price: "25", imageName: "shirt05.png", productQuantity: 1),
        Product(title: "Polo Shirt Light Red", price: "25", imageName: "shirt06.png", productQuantity: 1),
        Product(title: "Polo Shirt Navy Blue", price: "25", imageName: "shirt07.png", productQuantity: 1)
        
    ]
    
    let jackets = [
        
        Product(title: "Winter TheNorthFace Jacket Blue", price: "120", imageName: "jacket01.png", productQuantity: 1),
        Product(title: "Winter TheNorthFace Jacket Red", price: "120", imageName: "jacket02.png", productQuantity: 1),
        Product(title: "Running UnderArmour Jacket Blue", price: "80", imageName: "jacket03.png", productQuantity: 1),
        Product(title: "Running UnderArmour Jacket Red", price: "80", imageName: "jacket04.png", productQuantity: 1),
        Product(title: "Running UnderArmour Jacket Green", price: "80", imageName: "jacket05.png", productQuantity: 1)

    ]
    
    let jeans = [Product]()
    
    
    func getCategories() -> [Category] {
        
        return categories
        
    }
    
    
    func getProducts(forCategoryTitle title:String) -> [Product] {
        
        switch title {
            
        case "SHIRTS":
            return shirts
        case "HATS":
            return hats
        case "HOODIES":
            return hoodies
        case "JACKETS":
            return jackets
        case "JEANS":
            return jeans
        default:
            return shirts
            
        }
        
    }
    
    
}
