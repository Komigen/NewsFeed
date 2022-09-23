import UIKit

class ReadLaterCell: UITableViewCell {
    
    @IBOutlet weak var imagePost: UIImageView!{
        didSet {
            imagePost.layer.cornerRadius = 8.0
            imagePost.clipsToBounds = true
            imagePost.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
