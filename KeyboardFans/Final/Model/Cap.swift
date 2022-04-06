//
//  Cap.swift
//  Final
//
//  Created by 張明璿 on 2022/3/14.
//


import Foundation
//Order
//List : 大分類 Detail: 商品（實例 = deatil)
//Detail內含 id實例(商品id) fields實例（定義為Details:Cap）
struct Product {
    
    struct List:Decodable {
        
        let records: [Record]
        struct Record: Codable {
            let id: String
            let fields: Fields
        }
        
        struct Fields: Codable {
            let capID: Int
            let capName: String
            let capProfile: String
            let capMaterial: String
            let capProcess: String
            let capFont: String
            let capPrice: Int
            let capDescription: String
            let capImageURL: String
        }
        
    }
    
    struct Create:Encodable {
        
        let records: [Record]
        struct Record: Codable {
            let fields: Fields
        }
        
        struct Fields: Codable {
            let capID: Int
            let capName: String
            let capProfile: String
            let capMaterial: String
            let capProcess: String
            let capFont: String
            let capPrice: Int
            let capDescription: String
            let capImageURL: String
        }
        
    }
    
    struct Update:Encodable {
        
        let records: [Record]
        struct Record: Codable {
            let id: String
            let fields: Fields
        }
        
        struct Fields: Codable {
            let capID: Int
            let capName: String
            let capProfile: String
            let capMaterial: String
            let capProcess: String
            let capFont: String
            let capPrice: Int
            let capDescription: String
            let capImageURL: String
        }
        
    }
    
    struct Delete:Decodable {
        let records: [Record]
        struct Record: Codable {
            let id: String
            let deleted: Bool
        }
    }
    
}
//extension Order:APIService{
//    var route: APIRoute {
//        get {
//            .product()
//        }
//        set {
//            newValue
//        }
//    }
//}

  

        
        
    





class Cap : Codable{
    
    var capID: Int
    var capName: String
    var capProfile: String
    var capMaterial: String
    var capProcess: String
    var capFont: String
    var capPrice: Int
//    var productQuantity: String
    var capDescription: String
    var capImageURL: String
    
    init( capID: Int, capName: String, capProfile: String, capMaterial: String,capProcess: String,capFont: String,capPrice: Int, capDescription: String, capImageURL: String){
        
        self.capID = capID
        self.capName = capName
        self.capProfile = capProfile
        self.capMaterial = capMaterial
        self.capProcess = capProcess
        self.capFont = capFont
        self.capPrice = capPrice
        self.capDescription = capDescription
        self.capImageURL = capImageURL
        
        
    }
    
    
    
    
}
//
//let JSON = """
//[{"productID":"1","productName":"Mizu","productPrice":"600","productQuantity":"2","productDescription":"PBT","productURL":"https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg"},{"productID":"2","productName":"Binsu","productPrice":"750","productQuantity":"2","productDescription":"PBT","productURL":"https://upload.cc/i1/2022/03/01/zM90rK.jpeg"}]
//"""
//
//let jsonData = JSON.data(using: .utf8)!
//let productStore:[product] = try! JSONDecoder().decode([product].self, from: jsonData)

//print(productJson[0].productURL)




