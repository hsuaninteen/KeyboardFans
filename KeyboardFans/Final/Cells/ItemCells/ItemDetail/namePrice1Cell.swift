//
//  namePriceCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/5.
//

import UIKit

class namePrice1Cell: UITableViewCell {

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
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }



}
