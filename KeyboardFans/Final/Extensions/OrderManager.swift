//
//  OrderManager.swift
//  Final
//
//  Created by 張明璿 on 2022/3/17.
//

import Foundation


class OrderManager {
    
    static let shared = OrderManager()
    
    //商品UUID：數量
    var list = [String:Int]()
    var totalPoint:Double = 0
    
    func addOrder(by productData:[Product.List.Record],customerID: String,customerName: String,customerPhone: String,customerAddress: String,orderAccountNumber: Int,capID: String,quantity: Int,capName:String) -> [Order.Create.Record] {
        
        var result = [Order.Create.Record]()
        
        self.list.forEach({ item in
            if let product = productData.first(where: {$0.id == item.key})?.fields {
                let record = Order.Create.Record(fields: .init(customerID: customerID, customerName: customerName, customerPhone: customerPhone, customerAddress: customerAddress, orderAccountNumber: orderAccountNumber, capID: capID, quantity: quantity, capName: capName))
                result.append(record)
            }
        })
        return result
    }
    
    func addOrder(by productId:String,add quantity: Int) {
        
        if list.keys.first(where: {$0 == productId}) != nil {
            list[productId] = quantity + list[productId]!
        }else{
            list.updateValue(quantity, forKey: productId)
        }
    
    }
    
    func updateOrder(by productId:String,add quantity: Int) {
        list[productId] = quantity
     
    }
    
    func clearOrder() {
        list.removeAll()
    }
}
