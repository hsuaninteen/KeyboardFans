//
//  ItemCollectionViewCell.swift
//  Final
//
//  Created by 張明璿 on 2022/2/17.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemLikeButton: UIButton!
    @IBOutlet weak var cellWidthConstraints: NSLayoutConstraint!
    static let width = floor((UIScreen.main.bounds.width - 20) / 2)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellWidthConstraints?.constant = Self.width
    }
    
//    func notfoundProduct() {
//        quantityStepper.isHidden = true
//        nameLabel.text = "無此產品"
//        pointLabel.text = ""
//        quantityLabel.text = ""
//
//    }
//    //用來顯示灰色不合法資料
    
    
}
