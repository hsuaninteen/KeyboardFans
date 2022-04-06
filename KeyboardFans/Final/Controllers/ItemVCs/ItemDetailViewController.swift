//
//  ItemDetailViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/7.
//

import UIKit
import Kingfisher
import CoreData


class ItemDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var addToLike: UIButton!
    @IBOutlet weak var addToCart: UIButton!
    
    var selectNum : [IndexPath] = [[]]
    var numDetail = 0
   
    var numRealDetail: Int {
        
        //print("目前的路徑：\(selectNum)")
//        let numDetail = selectNum.last!
//        let numRealDetail = numDetail.row
//        print("real=\(numRealDetail)")
        
        return selectNum.last!.row
    }
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var ItemDetailTableView: UITableView!
    var productStoreDetail :productArray = productArray()
    var product: Product.List.Record!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//    func SetSth(){
//
//        var productId = numRealDetail
//    }

    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        productStoreDetail.productStore = singleProduct.sharedInstance.productStore
        // 3/3進度
       
        
        self.ItemDetailTableView.delegate = self
        self.ItemDetailTableView.dataSource = self
        
        ItemDetailTableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"tag1Cell")
        
        ItemDetailTableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"namePrice1Cell")
        
        ItemDetailTableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"label1Cell")
        
        ItemDetailTableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"description1Cell")

        if productStoreDetail.productStore.count < 4{
            sleep(1)
        }
        print("ori: \(productStoreDetail.productStore.count)")
        print("single: \(singleProduct.sharedInstance.productStore.count)")
        
        
//        for index in 0 ..<  (Int(productStore.productStore.count) ){
//            label.text! += " productID: \(productStore.productStore[index].productID)"
//            label.text! += " productName: \(productStore.productStore[index].productName)"
//            label.text! += " productPrice: \(productStore.productStore[index].productPrice)"
//
//            label.text! += " productDescription: \(productStore.productStore[index].productDescription)"
//            label.text! += " productURL: \(productStore.productStore[index].productURL)"
//
//        }
    
      

//        let numDetail = selectNum.endIndex
        
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        print(productStoreDetail.productStore[numRealDetail].capImageURL)
        
        let url = URL(string: "\(productStoreDetail.productStore[numRealDetail].capImageURL).png")
        
      //  let url = URL(string: "\(productStore.productStore[].productURL)")
       
        
        header.imageView.kf.setImage(with: url)

        ItemDetailTableView.tableHeaderView = header
        ItemDetailTableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 1, green: 0.9814676642, blue: 0.931596458, alpha: 1)
    }
    @IBAction func addLike(_ sender: Any) {
        func saveToLike(){
            
            var likeList : [LikeItemData] = []
            var addLikeBool = true
            
            func loadFromCoreDataLike(){
                let moc = CoreDataHelper.shared.managedObjectContext()
                let request = NSFetchRequest<LikeItemData>(entityName: "LikeItemData")
                
                moc.performAndWait {
                    do{//執行查詢的請求，回傳
                        let result = try moc.fetch(request)
                        likeList = result
                    }catch{
                        print("error \(error)")
                        likeList = []
                    }
                }
            }
            loadFromCoreDataLike()
            for i in 0..<likeList.count{
                if (numRealDetail == Int(likeList[i].likeItemID)){
                     addLikeBool = false
                    }
            }
            if addLikeBool == false
            {
                let controller = UIAlertController(title: "已添加到喜好清單", message: "可以在使用者頁面中查看", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(ACTION: UIAlertAction!) in})
               
                   controller.addAction(okAction)
                
                
                present(controller, animated: true, completion:nil)
                return
            }else{
                    //
                let controller = UIAlertController(title: "已添加到喜好清單", message: "可以在使用者頁面中查看", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(ACTION: UIAlertAction!) in})
               
                   controller.addAction(okAction)
                
                
                present(controller, animated: true, completion:nil)
                //
                
                
            let moc = CoreDataHelper.shared.managedObjectContext()
            let addLikeCoreData = LikeItemData(context: moc)
            addLikeCoreData.likeItemID = numRealDetail
            //toAdd.append(addCoreData)
            
            CoreDataHelper.shared.saveContext()
            }
        }
        
        saveToLike()
        
    }
//    func loadfrom(){
//        self.loadFromCoreData()
//        var array : [LikeItemData] = []
//        self.array[0].likeItemID
//    }
    @IBAction func addProduct(_ sender: Any) {
        //因為拿到的是Int indexPath.row從0開始 ID是String從1開始
        //因此把indexPath.row＋1後轉型        guard let superVC = parentViewController as? HomeViewController else { return }
        var addCartBool = true
        
        if let vc = tabBarController?.children[2].children.first as? CartViewController {
            
            vc.addCartID = numRealDetail
            vc.loadFromCoreData()
            
            for i in 0..<vc.toAdd.count{
                if (numRealDetail == Int(vc.toAdd[i].cartItemID)){
                     addCartBool = false
                    }
            }
           
            if addCartBool == true{
                vc.addCartBtn()
                
                tabBarController?.selectedIndex = 2
            }else{
                let controller = UIAlertController(title: "購物車已有此商品", message: "喜歡不如立即下單～", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(ACTION: UIAlertAction!) in})
               
                   controller.addAction(okAction)
                
                
                present(controller, animated: true, completion:nil)
                
            }
            vc.deleteBtn.isEnabled = true
        }
//        guard let pushVC = storyboard?.instantiateViewController(withIdentifier:"Cart" ) as? CartViewController else { return }
//        navigationController?.pushViewController(pushVC, animated: true)
//
//        pushVC.addCartID = numRealDetail
//        pushVC.addCartBtn()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        

               
    }
    //*****要改toAddLike
    func loadFromCoreData(){
        let moc = CoreDataHelper.shared.managedObjectContext()
        let request = NSFetchRequest<LikeItemData>(entityName: "LikeItemData")
        
        moc.performAndWait {
            do{//執行查詢的請求，回傳
                let result = try moc.fetch(request)
//                toAddLike = result
            }catch{
                print("error \(error)")
//                toAddLike = []
            }
        }
       
    }

   
}


extension ItemDetailViewController{
    
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {  //為了不同類別裡面可以有多項內容
        case 0: //商品圖片 (imageCell)
            return 1
        case 1: //商品名稱+價格 (namePriceCell)
            return 1
        case 2: //商品標籤 (labelCell)
            return 4
        case 3: //商品詳細介紹(descriptionCell)
            return 1
            
        default:
            return 1
        }
        
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
         
        if indexPath.section == 0 {
            let cell = ItemDetailTableView.dequeueReusableCell(withIdentifier: "label1Cell",for: indexPath)
            
            cell.textLabel?.text = "\(productStoreDetail.productStore[numRealDetail].capName)"
            
            return cell
        }else if indexPath.section == 1 {
            let cell = ItemDetailTableView.dequeueReusableCell(withIdentifier: "namePrice1Cell",for: indexPath)
            cell.textLabel?.text = "$\(productStoreDetail.productStore[numRealDetail].capPrice)"
           
            
            return cell
        }else if indexPath.section == 2 {
            
            let tagItems = ["鍵帽高度:\(productStoreDetail.productStore[numRealDetail].capProfile)", "鍵帽材質:\(productStoreDetail.productStore[numRealDetail].capMaterial)", "製造工藝:\(productStoreDetail.productStore[numRealDetail].capProcess)", "語言:\(productStoreDetail.productStore[numRealDetail].capFont)"]
            
            let cell = ItemDetailTableView.dequeueReusableCell(withIdentifier: "tag1Cell",for: indexPath)
            cell.textLabel?.text = "\(tagItems[indexPath.row])"


            return cell
        }else if indexPath.section == 3 {
            let cell = ItemDetailTableView.dequeueReusableCell(withIdentifier: "description1Cell",for: indexPath)
            cell.textLabel?.text = "\(productStoreDetail.productStore[numRealDetail].capDescription)"
           
            
            return cell
        }else{
            let cell = ItemDetailTableView.dequeueReusableCell(withIdentifier: "image1Cell",for: indexPath)
            
            return cell
        }
        
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
//
//        let url = URL(string: "https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg")
//        header.imageView.kf.setImage(with: url)
//          return header
//      }
      
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
      let view = UIView(frame: CGRect(x: 0, y: 0, width: ItemDetailTableView.frame.width, height: 10))
        view.backgroundColor = #colorLiteral(red: 0.8970320821, green: 0.9577217698, blue: 0.9621695876, alpha: 1)
        
        return view
    }
    
    
   
    

    
}

//extension Notification.Name{
//    static let addCart = Notification.Name("addCart")
//}


