//
//  SecondCollectionViewController.swift
//  CKWaveCollectionViewTransition
//
//  Created by Salvation on 7/13/15.
//  Copyright (c) 2015 CezaryKopacz. All rights reserved.
//

import UIKit

final class SecondCollectionViewController: UICollectionViewController {
    var selectNum:IndexPath = []
    private var ThirdVCId = "thirdCapSize"
    private let kCellId = "cellId"
    
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier:"thirdNew" ) as? NewViewController else { return }
        navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.selectID = indexPath
        secondViewController.numFrom1 = selectNum.row
       
    }
   // 先改判斷 可以省略不需要的判斷
    //推vc用一樣的格式推 推完再做判斷 去顯示不一樣的資料
    //要做到傳值取得值 一定要轉型
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! Dictionary2CollectionViewCell
        if selectNum == [0,0]{
            self.navigationItem.title = "鍵帽"
            let url = URL(string: secondImageURL0[indexPath.row])
            cell.dict2ImageView.kf.setImage(with: url)
        }else if selectNum == [0,1]{
            self.navigationItem.title = "軸體"
            let url = URL(string: secondImageURL0[indexPath.row])
            cell.dict2ImageView.kf.setImage(with: url)
            
        }else if selectNum == [0,2]{
            self.navigationItem.title = "常見配列"
            let url = URL(string:secondImageURL2[indexPath.row])
            cell.dict2ImageView.kf.setImage(with: url)
            
        }else{
            self.navigationItem.title = "常見品牌與說明書"
            let url = URL(string:secondImageURL3[indexPath.row])
            cell.dict2ImageView.kf.setImage(with: url)
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Configuration.numberOfItems
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }    
}

private enum Configuration {
    static let numberOfItems: Int = 4
}
extension SecondCollectionViewController
:
    UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width/2.01)

    }
    
}
