//
//  newOrderBig.swift
//  Final
//
//  Created by 張明璿 on 2022/3/24.
//

import Foundation

struct newOrderBig: Codable{  //大包
    //addOrder
    let orderID : String
    let storeID : String
    let customerID : String
    let orderAccountNumber : String
    
    init(orderID: String, storeID: String, customerID: String, orderAccountNumber: String){
        self.orderID = orderID
        self.storeID = storeID
        self.customerID = customerID
        self.orderAccountNumber = orderAccountNumber
    }
}
