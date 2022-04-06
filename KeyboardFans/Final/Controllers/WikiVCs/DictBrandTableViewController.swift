//
//  DictBrandTableViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/15.
// 這是給常用品牌＋說明書用的rrrrrrrrrrrrrrrrr！！
// 這是給常用品牌＋說明書用的rrrrrrrrrrrrrrrrr！！
// 這是給常用品牌＋說明書用的rrrrrrrrrrrrrrrrr！！

import UIKit
class DictBrandTableViewController: UITableViewController {
    var selectNum3 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"imageCell")
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"nameCell")

        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"descriptionCell")
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        
        let url = URL(string: "\(capHeaderUrl[selectNum3])")
        header.imageView.kf.setImage(with: url)
  
        self.tableView.tableHeaderView = header
        
        
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        
        self.tableView.tableFooterView = footer
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {  //為了不同類別裡面可以有多項內容
        case 0: //商品圖片 (imageCell)
            return 1
        case 1: //商品名稱+價格 (namePriceCell)
            return 1
        case 2: //商品標籤 (labelCell)
            return 1
        case 3: //商品詳細介紹(descriptionCell)
            return 1
            
        default:
            return 1
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell",for: indexPath)
            
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell",for: indexPath)
            
            return cell
        }
//        else if indexPath.section == 2 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell",for: indexPath)
//
//            return cell
//        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell",for: indexPath)
            
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        view.backgroundColor = #colorLiteral(red: 0.4711900353, green: 0.8403715491, blue: 0.9757193923, alpha: 1)
        
        return view
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    

    
    
}
