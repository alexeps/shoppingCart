//
//  ShopItemCell.swift
//  ShoppingCartApp
//
//  Created by EasternPeak on 6/14/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit

class ShopItemCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
