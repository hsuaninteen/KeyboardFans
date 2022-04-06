//
//  CartViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/2/14.
//

import UIKit
import CoreData
import Kingfisher
import SwiftUI


class CartViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet var emptyCartView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
   
    //like set
    var toAddLike : [LikeItemData] = []
    var addLikeID : Int = 0
    var likeItemNum = 0
    
    
    var productStoreTempLike :productArray = productArray()
    var productStoreLike :productArray = productArray()
  
    //var cartData = [productStore]
    var toAdd : [CartItemData] = []
    var addCartID : Int = 0
    var cartItemNum = 0
    
    var productStoreTemp :productArray = productArray()
    var productStoreCart :productArray = productArray()
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNum(notification: )) , name: .addCart, object: nil)
//    }
//    @objc func didReceiveNum(notification: Notification){
//        if let receiveNum = notification.userInfo?["postNum"]as?Int{
//             print(receiveNum)
//        }
//
    
//    func addLikeBtn()
//    {
//        
//        let moc = CoreDataHelper.shared.managedObjectContext()
//        let addLikeCoreData = LikeItemData(context: moc)
//        addLikeCoreData.likeItemID = addLikeID
//        toAddLike.append(addLikeCoreData)
//        
//        CoreDataHelper.shared.saveContext()
//        
//        
//        
//    }
    func reloadData(){
        self.reloadData()
    }
    func addCartBtn()
    {
        loadFromCoreData()
        let moc = CoreDataHelper.shared.managedObjectContext()
        let addCoreData = CartItemData(context: moc)
        addCoreData.cartItemID = addCartID
        toAdd.append(addCoreData)
        
        CoreDataHelper.shared.saveContext()
        
        
        
    }
    @IBAction func sendBtn(_ sender: UIButton) {
//        if let vc = tabBarController?.children[2].children.first as? SendViewController {
//
//            vc.str = "TEST"
//       }
        self.performSegue(withIdentifier: "sendVC", sender: self)
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           if segue.identifier == "sendVC" {
//               if let destination = segue.destination as? SendViewController {
//
//               }
//           }
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendVC" {
        let vc = segue.destination as? SendViewController
            vc?.str = totalLabel.text!
            vc?.toAddSend = toAdd
        }
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        loadFromCoreData()
        print("Core Data Count Now: \(self.toAdd.count)")
        cartTableView.backgroundView = emptyCartView
        cartTableView.backgroundView?.isHidden = true
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        // Do any additional setup after loading the view.
        
       
        
    }
    
    @IBAction func deleteCart(_ sender: Any) {
        let controller = UIAlertController(title: "確定清空購物車？", message: "刪除後無法復原需要重新加入", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "確定", style: .default, handler:{(action)in
            
            DeleteCart()
        })
       
        
           controller.addAction(okAction)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        
        present(controller, animated: true, completion:nil)
        
        
        
        func DeleteCart(){
            for i in 0..<toAdd.count{
                let deleteRow = toAdd[i]
            let moc = CoreDataHelper.shared.managedObjectContext()
            //new
            moc.performAndWait ({
                moc.delete(deleteRow)
            })
                CoreDataHelper.shared.saveContext()
                productStoreCart.productStore = []
                cartTableView.reloadData()
            }
            
        }
       
        
        let indexSet = IndexSet(integer: 0)
        self.cartTableView.reloadSections(indexSet, with: .automatic)
        print("reload done")
        print(productStoreCart.productStore.count)
        
        //self.deleteBtn.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFromCoreData()
        productStoreTemp.productStore = singleProduct.sharedInstance.productStore
       
        if productStoreTemp.productStore.count == 0{
            sleep(UInt32(0.5))
        }
        productStoreTemp.productStore = singleProduct.sharedInstance.productStore
                super.viewDidLoad()
        if toAdd.count > productStoreCart.productStore.count{
            productStoreCart.productStore = []
        for i in 0..<toAdd.count{
//            for j in 0..<productStoreCart.productStore.count{
//                if toAdd[j].cartItemID == productStoreCart.productStore[j].capID{
//
//                }
//
//            }
            
            productStoreCart.productStore.append(productStoreTemp.productStore[(toAdd[i].cartItemID)])
            
            }
        }
        self.cartTableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
         //self.
         super.viewDidAppear(animated)
        var countTotal = 0
        
        func countChange(){
            countTotal = 0
            for i in 0..<productStoreCart.productStore.count{
                var quantityForID = 1
                
                countTotal = countTotal + productStoreCart.productStore[i].capPrice * quantityForID
            }
        }
        countChange()
        self.totalLabel.text = ("\(countTotal)元")
         print("toadd")
        print(toAdd.count)
        
       
        
    }
    
    func saveToCoreData()  {
        CoreDataHelper.shared.saveContext()
        
    }
    func loadFromCoreData(){
        let moc = CoreDataHelper.shared.managedObjectContext()
        let request = NSFetchRequest<CartItemData>(entityName: "CartItemData")
        
        moc.performAndWait {
            do{//執行查詢的請求，回傳
                let result = try moc.fetch(request)
                self.toAdd = result
            }catch{
                print("error \(error)")
                self.toAdd = []
            }
        }
       
    }
   
    
}

extension CartViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.productStoreCart.productStore.count > 0 {
            self.cartTableView.backgroundView?.isHidden = true
            self.buyButton.superview?.isHidden = false
        }else{
            self.cartTableView.backgroundView?.isHidden = false
            self.buyButton.superview?.isHidden = true
        }

        
        return productStoreCart.productStore.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "OrderCell",for: indexPath)as! OrderCell
//購物車內容
//       let url = URL(string:"\(productStoreCart.productStore[indexPath.row].capImageURL)" )
       
       let url = URL(string:"\(productStoreCart.productStore[indexPath.row].capImageURL).png" )
      
       cell.productImageView.kf.setImage(with: url)
       
       
       cell.quantityLabel.text = "1"
       
       cell.productPrice.text = "\(productStoreCart.productStore[indexPath.row].capPrice)"
       cell.productName.text = "\(productStoreCart.productStore[indexPath.row].capName)"
            
        
        return cell
    }
    
    func reloadScreen(){}
    
}



