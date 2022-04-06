//
//  LikeVC.swift
//  Final
//
//  Created by 張明璿 on 2022/3/20.
//

import UIKit
import CoreData
import Kingfisher
import SwiftUI

class LikeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    @IBOutlet var EmptyLikeView: UIView!
    @IBOutlet weak var LikeTableView: UITableView!
    //var cartData = [productStore]
    var toAddLike : [LikeItemData] = []
    var addLikeID : Int = 0
    var likeItemNum = 0
    
    var productStoreTemp :productArray = productArray()
    var productStoreLike :productArray = productArray()
    
    

    
    func reloadData(){
        self.reloadData()
    }
    
    func addLikeBtn()
    {
        loadFromCoreDataLike()
        let moc = CoreDataHelper.shared.managedObjectContext()
        let addLikeCoreData = LikeItemData(context: moc)
        addLikeCoreData.likeItemID = addLikeID
        toAddLike.append(addLikeCoreData)
        
        CoreDataHelper.shared.saveContext()
        
        
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        loadFromCoreDataLike()
        print("Core Data Count Like: \(self.toAddLike.count)")
        LikeTableView.backgroundView = EmptyLikeView
        LikeTableView.backgroundView?.isHidden = true
        
        LikeTableView.delegate = self
        LikeTableView.dataSource = self
        // Do any additional setup after loading the view.
        
       
        
    }
//    @IBAction func deleteCart(_ sender: Any) {
//        let controller = UIAlertController(title: "確定清空購物車？", message: "刪除後無法復原需要重新加入", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "確定", style: .default, handler: {(ACTION: UIAlertAction!) in})
//
//           controller.addAction(okAction)
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//        controller.addAction(cancelAction)
//
//        present(controller, animated: true, completion:nil)
//
//
//
//        func DeleteCart(){
//            for i in 0..<toAdd.count{
//                let deleteRow = toAdd[i]
//            let moc = CoreDataHelper.shared.managedObjectContext()
//            //new
//            moc.performAndWait ({
//                moc.delete(deleteRow)
//            })
//                CoreDataHelper.shared.saveContext()
//                productStoreCart.productStore = []
//                cartTableView.reloadData()
//            }
//
//        }
//        print("before delete")
//        print(productStoreCart.productStore.count)
//
//                print("after delete")
//
//        print(productStoreCart.productStore.count)
//
//
//        let indexSet = IndexSet(integer: 0)
//        self.cartTableView.reloadSections(indexSet, with: .automatic)
//        print("reload done")
//        print(productStoreCart.productStore.count)
//
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFromCoreDataLike()
        productStoreTemp.productStore = singleProduct.sharedInstance.productStore
        if productStoreTemp.productStore.count == 0{
            sleep(UInt32(0.1))
            productStoreTemp.productStore =
            singleProduct.sharedInstance.productStore
        }
        if productStoreTemp.productStore.count == 0{
            sleep(UInt32(0.1))
            productStoreTemp.productStore = singleProduct.sharedInstance.productStore
        }
                super.viewDidLoad()
        if toAddLike.count > productStoreLike.productStore.count{
            productStoreLike.productStore = []
            
        for i in 0..<toAddLike.count{

            
            productStoreLike.productStore.append(productStoreTemp.productStore[(toAddLike[i].likeItemID)])

            }
        }
        self.LikeTableView.reloadData()
    }
//    override func viewDidAppear(_ animated: Bool) {
//         //self.
//         super.viewDidAppear(animated)
//        var countTotal = 0
//        func countChange(){
//            for i in 0..<productStoreCart.productStore.count{
//                countTotal = countTotal + productStoreCart.productStore[i].capPrice * (1)
//            }
//        }
//        countChange()
//        self.totalLabel.text = ("總金額:\(countTotal)元")
//         print("toadd")
//        print(toAdd.count)
//         print("暫存數量\(productStoreTemp.productStore.count)")
//         print("實際數量\(productStoreCart.productStore.count)")
//
//
//    }
    
    func saveToCoreData()  {
        CoreDataHelper.shared.saveContext()
        
    }
    func loadFromCoreDataLike(){
        let moc = CoreDataHelper.shared.managedObjectContext()
        let request = NSFetchRequest<LikeItemData>(entityName: "LikeItemData")
        
        moc.performAndWait {
            do{//執行查詢的請求，回傳
                let result = try moc.fetch(request)
                self.toAddLike = result
            }catch{
                print("error \(error)")
                self.toAddLike = []
            }
        }
       
    }
    
}

extension LikeVC{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
        let alertcontroller = UIAlertController(title: "確認刪除", message: "確定要刪除？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "確認", style: .destructive, handler: {(action) in
            let deleteLike = self.toAddLike.remove(at: indexPath.row)
            self.toAddLike.removeAll{like in
                return like === deleteLike
            }
            let moc = CoreDataHelper.shared.managedObjectContext()
            moc.performAndWait {
                moc.delete(deleteLike)
            }
            
            self.saveToCoreData()
            //
            self.productStoreLike.productStore = []
            for i in 0..<self.toAddLike.count{

                self.productStoreLike.productStore.append(self.productStoreTemp.productStore[(self.toAddLike[i].likeItemID)])

            }
            self.LikeTableView.reloadData()
            
            
          //
        })
            alertcontroller.addAction(cancelAction)
            alertcontroller.addAction(deleteAction)
            present(alertcontroller, animated: true, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStoreLike.productStore.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = LikeTableView.dequeueReusableCell(withIdentifier: "likeCell",for: indexPath)as! LikeCell
        
        let url = URL(string:"\(productStoreLike.productStore[indexPath.row].capImageURL).png" )
       
        cell.LikeImageView.kf.setImage(with: url)
        
    
        cell.LikePriceLabel.text = "\(productStoreLike.productStore[indexPath.row].capPrice)"
        cell.LikeNameLabel.text = "\(productStoreLike.productStore[indexPath.row].capName)"
         return cell
    }
}
