//
//  OrderDetail.swift
//  Final
//
//  Created by 張明璿 on 2022/3/16.
//

import Foundation
struct singleOrder{
    var itemID : String
    var itemName : String
    var itemPrice : Int
    var itemQuantity : Int
}

class OrderDetail{
    var item = [singleOrder]()
    
    func getTotal() -> Float {
        var total: Float = 0

        for item in self.item {
            total = total + Float(item.itemQuantity) * Float(item.itemPrice)
        }
        return total
    }// var total
    
}


class CartTemp{
    var CartItem = [OrderDetail]()
}
