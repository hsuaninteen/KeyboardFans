//
//  DIct3ImgTableViewCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/15.
//

import UIKit

class DIct3ImgTableViewCell: UITableViewCell {


  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIImage {
func getImageRatio() -> CGFloat {
let imageRatio = CGFloat(self.size.width / self.size.height)
return imageRatio
}
}
