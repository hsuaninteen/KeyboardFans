

import UIKit
import Kingfisher

 class MainViewController: UICollectionViewController {
     
    private let kSecondVCId = "secondVC"
   
    
    // MARK: - UICollectionViewDelegate
    
    
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndexPath = indexPath
        
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: kSecondVCId) as? SecondCollectionViewController else { return }
        navigationController?.pushViewController(secondViewController, animated: true)
         secondViewController.selectNum = selectedIndexPath
    }
    
    // MARK: - UICollectionViewDataSource
     override func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
     }
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
     }
     
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Dict1Cell", for: indexPath) as! DictioaryCollectionViewCell
        let url = URL(string: mainImageURL[indexPath.row])
        cell.dictImageView.kf.setImage(with: url)
        return cell
    }
    
   
   
}

extension MainViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width/2)

    }
    
    
}
