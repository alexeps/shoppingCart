//
//  CartViewController.swift
//  ShoppingCartApp
//
//  Created by EasternPeak on 6/14/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    var shopItems = [ShopItem]()
    var cartItemsToDisplay = [ShopItem]()

    @IBOutlet weak var cartList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cartList.dataSource = self
        reloadTableData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func reloadTableData() {
        cartItemsToDisplay = shopItems.filter { $0.cartItem.amount != 0 }
        self.cartList.reloadData()
    }
    
    func removeTapped(sender: UIButton) {
        cartItemsToDisplay[sender.tag].removeFromCart()
        self.reloadTableData()
    }

    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartItemCell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as! CartItemCell
        let shopItem: ShopItem = cartItemsToDisplay[indexPath.row]
        cell.name.text = shopItem.name
        cell.price.text = String(shopItem.price)
        cell.amount.text = String(shopItem.cartItem.amount)
        cell.removeButton.tag = indexPath.row
        cell.removeButton.addTarget(self, action: #selector(removeTapped), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItemsToDisplay.count
    }
}

