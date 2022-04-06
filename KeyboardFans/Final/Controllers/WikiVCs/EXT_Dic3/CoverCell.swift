
import UIKit
import Kingfisher
import CoreMedia

class CoverCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cellSelect = 0
    var cellNum = 0
    var cellNumOf1 = 0
    
    @IBOutlet var collectionView: UICollectionView!
   
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.isScrollEnabled = false
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! HomeCell

        let url = URL(string:UrlFather[cellNumOf1][cellNum][cellSelect])
        cell.homeImageView.kf.setImage(with: url)
//        cell.homeName.font = UIFont.systemFont(ofSize: 20)
//        cell.homeName.textAlignment = .center
        cell.homeName.text = NameFather[cellNumOf1][cellNum][cellSelect]
        cell.homeDescription.text = DescriptionFather[cellNumOf1][cellNum][cellSelect]
    
//
        return cell
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize.height = self.frame.height - 20
        layout.itemSize.width = UIScreen.main.bounds.width - 20

        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName:"HomeCell", bundle:nil),
                                forCellWithReuseIdentifier:"myCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
}
