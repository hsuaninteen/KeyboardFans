//
//  namePriceCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/5.
//

import UIKit

class namePriceCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        applyShadow(cornerRadius: 8)
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIView{
    func applyShadow (cornerRadius: CGFloat){
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = #colorLiteral(red: 0.4711900353, green: 0.8403715491, blue: 0.9757193923, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
}
