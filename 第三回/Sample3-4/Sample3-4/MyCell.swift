
import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    func setImg(img: UIImage){
        thumbImg.image = img
    }
    
}
