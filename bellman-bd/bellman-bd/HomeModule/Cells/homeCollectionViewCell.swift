//
//  homeCollectionViewCell.swift
//  bellman-bd
//
//  Created by iMac1 on 3/25/21.
//  Copyright © 2021 tashaleh. All rights reserved.
//

import UIKit

class homeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCat: UILabel!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.itemImage.layer.cornerRadius = 15.0
        self.itemImage.layer.borderColor = UIColor.lightGray.cgColor
        self.itemImage.layer.borderWidth = 1.0
        
    }

}
