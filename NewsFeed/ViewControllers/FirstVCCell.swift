import UIKit

class FirstVCCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var imagePost: UIImageView! {
        didSet {
            imagePost.layer.cornerRadius = 7.0
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
}
