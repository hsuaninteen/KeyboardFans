//
//  Meal.swift
//  FoodDeliveryApp
//
//  Created by Alvaro Gonzalez on 11/4/21.
//

import Foundation
import SwiftyJSON

class Meal {

    var id: Int?
    var name: String?
    
    var image: String?
    var price: Float?
    
    init(json: JSON) {
        
        self.id = json["id"].int
        self.name = json["name"].string
        
        self.image = json["image"].string
        self.price = json["price"].float
    }
}
