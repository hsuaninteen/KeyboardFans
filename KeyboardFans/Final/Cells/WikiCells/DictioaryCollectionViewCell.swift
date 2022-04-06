//
//  DictioaryCollectionViewCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/7.
//

import UIKit

class DictioaryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var dictImageView: UIImageView!
    

//    @IBOutlet weak var cellWidthConstraints: NSLayoutConstraint!
//    static let width = floor((UIScreen.main.bounds.width
//                             ) / 2)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        cellWidthConstraints?.constant = Self.width
    }
    
    
    
}
