//
//  File.swift
//  Final
//
//  Created by 張明璿 on 2022/3/9.
//

import UIKit

class singleProduct {
    
    static let sharedInstance = singleProduct()
    private init() {
        getProductStore()
    }
    var productStore = [Cap]()
    
    func getProductStore() -> [Cap]{
        self.getURLData()
        
        
        print("\(productStore.count)")
        return productStore
        if productStore.count == 0{
            self.getURLData()
            sleep(UInt32(0.05))
            return productStore
        }
        
    }
    
    func getURLData() {
        
        let address = "https://roaddasher.herokuapp.com/api/cap/?format=json"
        if  let Url = URL(string: address) {
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
        
        
    }
    func parseJsonData(data: Data) -> [Cap]
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
                        //print("product URL: \(productURL)")
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
                        sleep(UInt32(0.01))
                        
                    }
                }
                
            }
            
            
        }
        catch{
            print(error)
        }
        return self.productStore
    }
    
}
