//
//  MenuCell.swift
//  OnlineStore
//
//  Created by Stanislav Grigorov on 7.01.18.
//  Copyright © 2018 Stanislav Grigorov. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.cornerRadius = 8
        
    }
    
    func setupView(name : String) {
        
        nameLabel.text = name

    }

}
