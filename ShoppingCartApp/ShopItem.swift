//
//  ShopItem.swift
//  ShoppingCartApp
//
//  Created by EasternPeak on 6/14/17.
//  Copyright © 2017 EasternPeak. All rights reserved.
//

import UIKit

class ShopItem: NSObject {
    var uuid: String = NSUUID().uuidString
    var name: String = ""
    var price: Float = Float(100 + arc4random_uniform(900))
    var amount: Int = Int(1 + arc4random_uniform(5))
    var cartItem: CartItem = CartItem()
    
    
    func addToCart() {
        if(self.amount > 0) {
            self.amount -= 1
            self.cartItem.amount += 1
        }
    }
    
    func removeFromCart() {
        if(self.cartItem.amount > 0) {
            self.cartItem.amount -= 1
            self.amount += 1
        }
    }
}
