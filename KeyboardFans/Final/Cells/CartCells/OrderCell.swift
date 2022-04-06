//
//  OrderCell.swift
//  Final
//
//  Created by 張明璿 on 2022/3/10.
//

import UIKit
//protocol OrderCellDelegate {
//    func updateTotalPoint()
//}
class OrderCell: UITableViewCell {


    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
  
    @IBOutlet weak var quantityLabel: UILabel!

    
//    var delegate:OrderCellDelegate?

   
    private var quantity: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func plus(_ sender: Any) {
        func plusPress(){
        let currentQuantity = Int(quantityLabel.text!)
        let newQuantity = currentQuantity! + 1
    quantityLabel.text = "\(newQuantity)"
        }
        
    }
    @IBAction func minus(_ sender: Any) {
        func minusPress(){
        let currentQuantity = Int(quantityLabel.text!)
        if currentQuantity! > 1{
            let newQuantity = currentQuantity! - 1
            quantityLabel.text = "\(newQuantity)"
        }
        }
        
    }
        
    //    @IBAction func valueChange (_ sender:UIButton ) {
//        guard let qty = quantityLabel.text, let currentQuantity = Int(qty) else {return}
//        if sender.tag == 0 {
//            if currentQuantity > 1{
//                let newQuantity = currentQuantity - 1
//                quantityLabel.text = "\(newQuantity)"

//            }else {
//                return
//            }
//        }else if sender.tag == 1{
//
//                let newQuantity = currentQuantity + 1
//            quantityLabel.text = "\(newQuantity)"
//        }else {
//                return
//            }
//        }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }

}
