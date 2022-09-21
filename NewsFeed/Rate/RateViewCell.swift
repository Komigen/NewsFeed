import UIKit

class RateViewCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView! {
        didSet {
            imageIcon.layer.cornerRadius = 8.0
            imageIcon.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameRate: UILabel!
    @IBOutlet weak var shortNameRate: UILabel!
    
    @IBOutlet weak var valueRate: UILabel!

}
