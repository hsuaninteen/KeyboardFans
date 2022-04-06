//
//  Order.swift
//  Final
//
//  Created by 張明璿 on 2022/3/16.


import Foundation
//struct Order {
//    struct List:
//    var orderID: String = ""
//    var customerID: String = ""
//    var storeID : String = ""
//    var orderAccountNumber: Int = 00000
//}
struct Order {
    struct List:Decodable {
        let records: [Record]
        struct Record : Codable {
            let id : String
            let fields: Fields
        }
        
        struct Fields: Codable {
            let customerID : String
            let customerName : String
            let customerPhone : String
            let customerAddress : String
            let orderAccountNumber : Int
            let capID : String
            let quantity : Int
        }
        
    }
    struct Create:Encodable {
        
        let records: [Record]
        struct Record: Codable {
            let fields: Fields
        }

        struct Fields: Codable {
            let customerID : String
            let customerName : String
            let customerPhone : String
            let customerAddress : String
            let orderAccountNumber : Int
            let capID : String
            let quantity : Int
            let capName : String
        }
        
    }

    struct Update:Encodable {
        
        let records: [Record]
        struct Record: Codable {
            let id: String
            let fields: Fields
        }
        struct Fields: Codable {
            let customerID : String
            let customerName : String
            let customerPhone : String
            let customerAddress : String
            let orderAccountNumber : Int
            let capID : Int
            let quantity : Int
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
//extension Product:APIService{
//    var route: APIRoute {
//        get {
//            .product()
//        }
//        set {
//            newValue
//        }
//    }
//}

