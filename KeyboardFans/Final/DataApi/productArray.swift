//
//  ProductArray.swift
//  Final
//
//  Created by 張明璿 on 2022/3/3.
//

import Foundation
import Alamofire

class productArray{
    var productStore:[Cap] = [Cap]()
    
    init(){
        //self.getURLData()
    }
    
    func getURLData(){
        
        //        let JSON = """
        //        [{"productID":"1","productName":"Mizu","productPrice":600,"productQuantity":"2","productDescription":"PBT","productURL":"https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg"},{"productID":"2","productName":"Binsu","productPrice":750,"productQuantity":"2","productDescription":"PBT","productURL":"https://upload.cc/i1/2022/03/01/zM90rK.jpeg"}]
        //        """
        //        let jsonData = JSON.data(using: .utf8)!
        //        let productJson:[Product] = try! JSONDecoder().decode([Product].self, from: jsonData)
        //        self.productArray = productJson
        
        //"http://192.168.36.196:8000/api/product/?format=json"
        //"https://roaddasher.herokuapp.com/api/product/"
        let address = "http://192.168.0.100:8000/api/cap/?format=json"
        
        guard let Url = URL(string: address) else {
            return
        }
        let request = URLRequest(url: Url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            // 解析 JSON 資料
            if let data = data {
                
                self.productStore = self.parseJsonData(data: data)
                
            }
        })
        
        task.resume()
    }
    
    func parseJsonData(data:Data) -> [Cap]
    {
        
        
        do{
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any] {
                for item in json {
                    if let object = item as? [String: Any] {
                        
                        let capIDD = object["capID"] as? String ?? "N/A"
                        let capID = Int(capIDD)!
                        
                        let capName = object["capName"] as? String ?? "N/A"
                       
                        let capProfile = object["capProfile"] as? String ?? "N/A"
                        let capMaterial = object["capMaterial"] as? String ?? "N/A"
                        let capProcess = object["capProcess"] as? String ?? "N/A"
                        let capFont = object["capFont"] as? String ?? "N/A"
                        let capPrice = object["capPrice"] as? Int ?? 0
                        let capImageURL = object["capImageURL"] as? String ?? "N/A"
                        let capDescription = object["capDescription"] as? String ?? "N/A"
                       // print("product URL: \(productURL)")
                        let tempProduct = Cap( capID : capID,
                                               capName : capName,
                                               capProfile : capProfile,
                                               capMaterial : capMaterial,
                                               capProcess : capProcess,
                                               capFont : capFont,
                                               capPrice : capPrice,
                                               capDescription : capDescription,
                                               capImageURL : capImageURL)
                        
                        
                        
                        self.productStore.append(tempProduct)
                        
                    }
                }
                
            }
            
            
        }
        catch{
            print(error)
        }
        return self.productStore
    }
    


}//End of ProductArray
