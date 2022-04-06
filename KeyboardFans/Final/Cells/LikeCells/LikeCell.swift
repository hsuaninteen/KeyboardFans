//
//  LikeCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/10.
//

import UIKit
//protocol OrderCellDelegate {
//    func updateTotalPoint()
//}
class LikeCell: UITableViewCell {


    @IBOutlet weak var LikeNameLabel: UILabel!
    @IBOutlet weak var LikePriceLabel: UILabel!
    @IBOutlet weak var LikeImageView: UIImageView!
    
    private var product : Product.List.Record!
    private var quantity: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

