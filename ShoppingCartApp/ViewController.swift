//
//  ViewController.swift
//  ShoppingCartApp
//
//  Created by EasternPeak on 6/14/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shopItems = [ShopItem]()
    var shopItemsToDisplay = [ShopItem]()
    
    @IBOutlet weak var shopList: UITableView!
    var cartButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...19 {
            let shopItem = ShopItem()
            shopItem.name = "Product\(i + 1)"
            self.shopItems.append(shopItem)
        }
        self.shopList.dataSource = self;
        
        self.createBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadTableData()
        self.updateCartData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBarButton() {
        cartButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(barButtonTapped))
        self.navigationItem.setRightBarButton(cartButton, animated: false)
    }
    
    func barButtonTapped() {
        self.performSegue(withIdentifier: "showCart", sender: self)
    }
    
    func buyTapped(sender: UIButton) {
        shopItemsToDisplay[sender.tag].addToCart()
        self.reloadTableData()
        self.updateCartData()
    }
    
    func reloadTableData() {
        shopItemsToDisplay = shopItems.filter { $0.amount != 0 }
        self.shopList.reloadData()
    }
    
    func updateCartData() {
        let cartItemsTotal: Int = shopItems.reduce(0) { $0 + $1.cartItem.amount }
        let cartItemsTotalPrice: Float = shopItems.reduce(0) { $0 + (Float($1.cartItem.amount) * $1.price) }
        cartButton?.title = "Cart: \(cartItemsTotal) Price: \(cartItemsTotalPrice)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cartVC: CartViewController = segue.destination as! CartViewController
        cartVC.shopItems = shopItems
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopItemCell = tableView.dequeueReusableCell(withIdentifier: "shopItemCell", for: indexPath) as! ShopItemCell
        let shopItem: ShopItem = shopItemsToDisplay[indexPath.row]
        cell.name.text = shopItem.name
        cell.price.text = String(shopItem.price)
        cell.amount.text = String(shopItem.amount)
        cell.buyButton.tag = indexPath.row
        cell.buyButton.addTarget(self, action: #selector(buyTapped), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopItemsToDisplay.count
    }
}



