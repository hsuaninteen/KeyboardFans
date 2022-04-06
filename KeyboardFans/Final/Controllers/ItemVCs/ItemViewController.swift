//
//  ItemViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/1.
//

import UIKit
import Kingfisher
import Alamofire

class ItemViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var segmentedControl = UISegmentedControl()
    var productStore :productArray = productArray()
    var pageViewControl = UIPageViewController()
    var viewControllerArr = Array<UIViewController>()
    var selectedIndex: Int = 0
    
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        
        productStore.productStore = singleProduct.sharedInstance.productStore
        
        if singleProduct.sharedInstance.productStore.count == 0 {
            sleep(1)
        }
        if singleProduct.sharedInstance.productStore.count == 0 {
            sleep(1)
        }
        if singleProduct.sharedInstance.productStore.count == 0 {
            sleep(1)
        }
        productStore.productStore = singleProduct.sharedInstance.productStore
        
        super.viewDidLoad()
        
        //seg
        segmentedControl = UISegmentedControl(items: ["鍵帽","軸體(即將推出)"])
            segmentedControl.backgroundColor = UIColor.lightGray
//            segmentedControl.frame = CGRect.init(x: 0, y: 44, width: self.view.frame.width, height: 30)
            segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
            
        
       
        // 3/3進度
       
        //var instance = singleProduct.sharedInstance
        
        
        //instance.getURLData()
        
//        if productStore.productStore.count < 4{
//            sleep(1)
//        }
        
        
        
        print("didload single: \(singleProduct.sharedInstance.productStore.count)")
        // Do any additional setup after loading the view.
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
        
    }
    @objc func segmentedChange(sender: UISegmentedControl) {
        // index
        print(sender.selectedSegmentIndex)

        // 文字
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
    }
    override func viewDidAppear(_ animated: Bool) {
        
        

    }

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    override func prepare (for segue : UIStoryboardSegue,sender: Any?){
        let controller = segue.destination as? ItemDetailViewController
        if let row = itemCollectionView.indexPathsForSelectedItems{
        print(row)
            controller!.selectNum = row
        
        }
    }

}


extension ItemViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int{
        print("\(productStore.productStore.count)")
        return productStore.productStore.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        
 
        let url = URL(string: "\(productStore.productStore[indexPath.row].capImageURL).png")
        cell.itemImageView.kf.setImage(with: url)
        cell.itemNameLabel.text = "\(productStore.productStore[indexPath.row].capName)"
        cell.itemPriceLabel.text = "$\(productStore.productStore[indexPath.row].capPrice)"
        return cell
    }
//     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedNum = indexPath.row
//        print("點了\(selectedNum)")
//    
//         
//         
//    }
//    

    
}


extension ItemViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width/2.1, height: collectionView.frame.size.height/2.0)

    }
    
    
}

extension ItemViewController: UISearchBarDelegate{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
     
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
    }
}
