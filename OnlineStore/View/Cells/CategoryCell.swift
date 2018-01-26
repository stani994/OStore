 //
//  CategoryCell.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 25.12.17.
//  Copyright © 2017 Stanislav Grigorov. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    func setupView(category: Category) {
        
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
        
    }
    
}
