//
//  User.swift
//  Final
//
//  Created by 張明璿 on 2022/3/22.
//

import Foundation
import SwiftyJSON

class User {
    var name: String?
    var email: String?
    var pictureURL: String?
    var method: String?
    
    static let currenUser = User()
    func setInfo(name: String, email: String, pictureURL: String, method: String) {
        self.name = name
        self.email = email
        self.pictureURL = pictureURL
        self.method = method
    }
    func setInfo(json: JSON) {
        self.name = json["name"].string
        self.email = json["email"].string
        
        let image = json["picture"].dictionary
        let imageData = image?["data"]?.dictionary
        self.pictureURL = imageData?["url"]?.string
        
    }
    
    func resetInfo() {
        self.name = nil
        self.email = nil
        self.pictureURL = nil
        self.method = nil
    }
  
}
