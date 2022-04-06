//
//  ItemDetailTableViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/5.
//

import UIKit
import Kingfisher
class ItemDetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"imageCell")
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"namePriceCell")
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"labelCell")
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"descriptionCell")
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        
        let url = URL(string: "https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg")
        header.imageView.kf.setImage(with: url)
  
        self.tableView.tableHeaderView = header
        
        
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        
        self.tableView.tableFooterView = footer
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {  //為了不同類別裡面可以有多項內容
        case 0: //商品圖片 (imageCell)
            return 1
        case 1: //商品名稱+價格 (namePriceCell)
            return 2
        case 2: //商品標籤 (labelCell)
            return 2
        case 3: //商品詳細介紹(descriptionCell)
            return 2
            
        default:
            return 1
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell",for: indexPath)
        //
        //        let url = URL(string: "https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg")
        //        cell.imageView?.kf.setImage(with: url)
        //
        //
        //        return cell
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell",for: indexPath)
            
            
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "namePriceCell",for: indexPath)
            
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell",for: indexPath)
            
            return cell
        }else{
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

extension ItemDetailTableViewController{

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let header = self.tableView.tableHeaderView as! StretchyTableHeaderView
            header.scrollViewDidScroll(scrollView: scrollView)
        
    }
}
