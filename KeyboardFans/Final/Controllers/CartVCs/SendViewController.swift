//
//  SendViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/22.
//

import UIKit
import SwiftyJSON
import Alamofire
    var totalText = ""

class SendViewController: UIViewController {
    var toAddSend : [CartItemData] = []
    @IBOutlet weak var accountOutlet: UITextField!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var phoneOutlet: UITextField!
    @IBOutlet weak var addressOutlet: UITextField!
    var str = ""
    var newOrderName = ""
    var newOrderPhone = ""
    var newOrderAddress = ""
    var newOrderAccount = ""
    var newOrderProductID : Int = 0
    
    
    
    override func viewWillAppear(_ animated: Bool) {
//        var totalText = ""
        OrderTotal.text = str
        UserName.text = User.currenUser.name
        UserEmail.text = User.currenUser.email
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
      }
    
    @IBAction func orderAccountEnter(_ sender: Any) {
        newOrderAccount = accountOutlet.text ?? ""
    }
    @IBAction func orderAddressEnter(_ sender: Any) {
        newOrderAddress = addressOutlet.text ?? ""
        
    }
    @IBAction func orderNameEnter(_ sender: Any) {
        newOrderName = nameOutlet.text ?? ""
    }
    @IBAction func orderPhoneEnter(_ sender: Any) {
        newOrderPhone = phoneOutlet.text ?? ""
    }
    
    @IBOutlet weak var UserName: UILabel!
    
   
    @IBOutlet weak var OrderTotal: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func sendOrder(_ sender: Any) {
        if User.currenUser.method == nil{
            let controller = UIAlertController(title: "您尚未登入", message: "登入後才能送出訂單", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {(ACTION: UIAlertAction!) in})
           
               controller.addAction(okAction)
            
            
            present(controller, animated: true, completion:nil)
            
            return
        }else{
            if nameOutlet.text == ""{
                let alert = UIAlertController(title: "請輸入收件人姓名", message: "這是必填項目", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }else if phoneOutlet.text == ""{
                let alert = UIAlertController(title: "請輸入手機號碼", message: "這是必填項目", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }else if addressOutlet.text == ""{
                let alert = UIAlertController(title: "請輸入收件地址", message: "這是必填項目", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }else if accountOutlet.text == ""{
                let alert = UIAlertController(title: "請輸入匯款帳號末五碼", message: "這是必填項目", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }else{
                //上傳訂單
                
                //newOrderBig()
                /*
                 let orderID : String
                 let productID : String
                 let quantity : Int
                 
                 */
                let str = UUID().uuidString
                let index = str.index(str.startIndex, offsetBy: 24)
                let UUIDSubstring = str[..<index] // Hello
                
                
                func postSmallMethod() {
                    
                    for i in 0..<toAddSend.count{
                        let instance = newOrder(orderID : String(UUIDSubstring) , productID: "\(toAddSend[i].cartItemID)", quantity:1 )
                        
                        
                        var methodID : String = ""
                        methodID = "\(toAddSend[i].cartItemID)"
                        let params: Parameters = [
                            "orderID": "\(UUIDSubstring)",
                            "productID": methodID,
                            "quantity": "1"
                        ]
                        //  小包
                       
                       AF.request("https://roaddasher.herokuapp.com/api/addOrderDetails/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                           do {
                               guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                                   print("Error: Cannot convert data to JSON object")
                                   return
                               }
                               guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                   print("Error: Cannot convert JSON object to Pretty JSON data")
                                   return
                               }
                               guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                   print("Error: Could print JSON in String")
                                   return
                               }
                               
                               print(prettyPrintedJson)
                           } catch {
                               print("Error: Trying to convert JSON data to string")
                               return
                           }
                       }
                   }
                }
                //postSmallMethod()//小包動作
                func postBigMethod() {
                        //  大包
                       let params: Parameters = [
                           "orderID": "3",
                           "productID": "2",
                           "quantity": "2"
                       ]
                       
                       AF.request("https://roaddasher.herokuapp.com/api/addOrderDetails/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                           do {
                               guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                                   print("Error: Cannot convert data to JSON object")
                                   return
                               }
                               guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                   print("Error: Cannot convert JSON object to Pretty JSON data")
                                   return
                               }
                               guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                   print("Error: Could print JSON in String")
                                   return
                               }
                               
                               print(prettyPrintedJson)
                           } catch {
                               print("Error: Trying to convert JSON data to string")
                               return
                           }
                       }
                   }
                
                //postBigMethod()
             
                let alert = UIAlertController(title: "訂單已送出", message: "請至使用者訂購記錄確認", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                recordNum = 1
            }

         
           
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
