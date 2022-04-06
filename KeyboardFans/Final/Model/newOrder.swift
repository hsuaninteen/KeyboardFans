//
//  newOrder.swift
//  Final
//
//  Created by 張明璿 on 2022/3/24.
//

import Foundation

struct newOrder: Codable{
    let orderID : String
    let productID : String
    let quantity : Int
    
    init(orderID: String, productID: String, quantity :Int){
        self.orderID = orderID
        self.productID = productID
        self.quantity = quantity
    }
}
