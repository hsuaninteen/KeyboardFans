
import UIKit

class NewViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var selectID: IndexPath = []
    var numFrom1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        if numFrom1 == 0{
        let url = URL(string: capHeaderUrl[selectID.row])
            header.imageView.kf.setImage(with: url)

            self.tableView.tableHeaderView = header
        
        }
        if numFrom1 == 3 {
            let url = URL(string: capHeaderUrl3[selectID.row])
            header.imageView.kf.setImage(with: url)

            self.tableView.tableHeaderView = header
        
        }else{
            let url = URL(string: capHeaderUrl[selectID.row])
        header.imageView.kf.setImage(with: url)

        self.tableView.tableHeaderView = header
        }
    
    }
    
    
  
    
    
    

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y:  0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName:"CoverCell", bundle:nil),
                           forCellReuseIdentifier:"myCell")
        return tableView
    }()
    
    // 設置 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    // count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if numFrom1 == 0 { if selectID == [0,0]{
            self.navigationItem.title = "鍵帽高度"
        }else if selectID == [0,1]{
            self.navigationItem.title = "鍵帽材質"
        }else if selectID == [0,2]{
            self.navigationItem.title = "鍵帽製造工藝"
        }else{
            self.navigationItem.title = "鍵帽字體"
        }
        }else if numFrom1 == 1 { if selectID == [0,0]{
            self.navigationItem.title = "Cherry櫻桃"
        }else if selectID == [0,1]{
            self.navigationItem.title = "Gateron佳達隆"
        }else if selectID == [0,2]{
            self.navigationItem.title = "Kailh凱華"
        }else{
            self.navigationItem.title = "TTC正牌科電"
        }}else if numFrom1 == 2 { if selectID == [0,0]{
            self.navigationItem.title = "60%配列"
        }else if selectID == [0,1]{
            self.navigationItem.title = "80%配列"
        }else if selectID == [0,2]{
            self.navigationItem.title = "980配列"
        }else{
            self.navigationItem.title = "100%配列"
        }}else if numFrom1 == 3 {
            if selectID == [0,0]{
                self.navigationItem.title = "Ducky"
            }else if selectID == [0,1]{
                self.navigationItem.title = "Leopold"
            }else if selectID == [0,2]{
                self.navigationItem.title = "Filco"
            }else{
                self.navigationItem.title = "Varmilo阿米洛"
            }}
        
        
        
        
        let cell:CoverCell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        as! CoverCell
        cell.cellNum = selectID.row
        cell.cellNumOf1 = numFrom1
        cell.cellSelect = indexPath.row
        return cell
        
    }
}


