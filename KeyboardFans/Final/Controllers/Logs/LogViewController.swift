//
//  LogViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/2/14.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import AuthenticationServices
import Alamofire
import Kingfisher

class LogViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var driverAvatar: UIImageView!
    @IBOutlet weak var userInfo: UIView!
    @IBOutlet weak var LogtableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance.signIn(
//           with: signInConfig,
//           presenting: self
//       )
//        { user, error in
//           guard error == nil else { return }
//           guard let user = user else { return }
//
//           // Your user is signed in!
//       }

        // Do any additional setup after loading the view.
        self.LogtableView.delegate = self
        self.LogtableView.dataSource = self
        
        LogtableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"log1")
        
        
//        LogtableView.register(UITableViewCell.self,
//                           forCellReuseIdentifier:"log2")
        
        LogtableView.register(UITableViewCell.self,
                           forCellReuseIdentifier:"log3")
        
        
        if User.currenUser.pictureURL == ""{
            User.currenUser.pictureURL = "https://i.imgur.com/FbO6fuQ.jpeg"
        }
   //
        if User.currenUser.method != "Facebook"{
            
            if let url = URL(string: User.currenUser.pictureURL ?? "") {
                
                if let data = try? Data(contentsOf: url) { //here you get image data from url
                    
                    
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.driverAvatar.image = image
                        }
                    }
                }
            }
            
        }else{
            
            if let url = User.currenUser.pictureURL{
                AF.download(url).responseData { response in
                    if let data = response.value {
                        let image = UIImage(data: data)
                        
                        self.driverAvatar.image = image
                        
                    }
                }
            }
            
        }
        
        
        //
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadUser()
    }
    func reloadUser(){
        lbName.text = User.currenUser.name
        lbEmail.text = User.currenUser.email
        if let url = User.currenUser.pictureURL{
            AF.download(url).responseData { response in
                if let data = response.value {
                    let image = UIImage(data: data)
                    
                    self.driverAvatar.image = image
                    
                }
            }
        }
    }

    @IBAction func logOutButton(_ sender: Any) {
        lbName.text = User.currenUser.name
        lbEmail.text = User.currenUser.email
        if let url = User.currenUser.pictureURL{
            AF.download(url).responseData { response in
                if let data = response.value {
                    let image = UIImage(data: data)
                    
                    self.driverAvatar.image = image
                    
                }
            }
        }
        //  logInMethod.text = User.currenUser.method
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


extension LogViewController{
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var VCID = ""
        if indexPath.section == 0{
            VCID = "likeVC"
        }else if indexPath.section == 1{
           
            VCID = "loginVC"
        }else{
            return
        }
        
       
        if indexPath.section == 0{
            guard let secondLogVC = storyboard?.instantiateViewController(withIdentifier:VCID) as? LikeVC else {return}
            navigationController?.pushViewController(secondLogVC, animated: true)
        }else if indexPath.section == 1{
            guard let secondLogVC = storyboard?.instantiateViewController(withIdentifier:VCID) as? LoginViewController else {return}
            navigationController?.pushViewController(secondLogVC, animated: true)
        }else{}
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 2
   }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // #warning Incomplete implementation, return the number of rows
       switch section {  //為了不同類別裡面可以有多項內容
       case 0: //商品圖片 (imageCell)
           return 1
       case 1: //商品名稱+價格 (namePriceCell)
           return 1
       
      
           
       default:
           return 1
       }
       
   }
   
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        
       if indexPath.section == 0 {
           let cell = LogtableView.dequeueReusableCell(withIdentifier: "log1",for: indexPath)
           
           cell.textLabel?.text = "喜好清單"
           
           return cell
       }else {
           
           
           let cell = LogtableView.dequeueReusableCell(withIdentifier: "log3",for: indexPath)
           cell.textLabel?.text = "登入"
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
     if section != 2{
     let view = UIView(frame: CGRect(x: 0, y: 0, width: LogtableView.frame.width, height: 10))
       view.backgroundColor = #colorLiteral(red: 0.9027128816, green: 1, blue: 0.9592733979, alpha: 1)
       
       return view
     }else{
         let view = UIView(frame: CGRect(x: 0, y: 0, width: LogtableView.frame.width, height: 0))
           
           return view
     }
 
 }
   
   
  
   
}
   

