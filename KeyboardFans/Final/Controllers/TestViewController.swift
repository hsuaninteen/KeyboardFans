//
//  ViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/2/14.
//

import UIKit
import Kingfisher
class TestViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var Test: UIImageView!
    var test = productArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
       
        let url = URL(string: "https://upload.cc/i1/2022/03/01/oQ79Kn.jpeg")
        Test.kf.setImage(with: url)
        
    
        
    }


}

