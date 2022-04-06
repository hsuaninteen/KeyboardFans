//
//  Restaurant.swift
//  FoodDeliveryApp
//
//  Created by Alvaro Gonzalez on 11/4/21.
//

import Foundation
import SwiftyJSON
    //對你來說只有1
//
class Restaurant {
    
    var id: Int?
   
    
    init(json: JSON) {
        self.id = json["id"].int
        
    }
}
