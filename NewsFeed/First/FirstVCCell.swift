import UIKit

class FirstVCCell: UITableViewCell {
    
    @IBOutlet weak var titleText: UILabel! {
        didSet {
            titleText.font.withSize(17.0)
        }
    }
    
    @IBOutlet weak var authorText: UILabel! {
        didSet {
            authorText.font.withSize(13.0)
            authorText.textColor = UIColor.systemGrayCustom
        }
    }
    
    @IBOutlet weak var imagePost: UIImageView! {
        didSet {
            imagePost.layer.cornerRadius = 8.0
            imagePost.clipsToBounds = true
            imagePost.contentMode = .scaleAspectFill
        }
    }
}




