//
//  OrderRecordViewController.swift
//  KeyboardFans
//
//  Created by 張明璿 on 2022/3/25.
//

import UIKit
var recordNum = 0

class OrderRecordViewController: UIViewController {
    @IBOutlet weak var Golden: UIImageView!
    
    @IBOutlet weak var Black: UIImageView!
    override func viewDidLoad() {
        if recordNum == 1 {
            Barrier.backgroundColor = .clear
            
        }
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var Barrier: UIView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
