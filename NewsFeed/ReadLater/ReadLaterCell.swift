import UIKit

class ReadLaterCell: UITableViewCell {
    
    @IBOutlet weak var imagePost:         UIImageView!{
        didSet {
            imagePost.layer.cornerRadius  = 8.0
            imagePost.clipsToBounds       = true
            imagePost.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            imagePost.contentMode         = .scaleAspectFill
        }
    }
    @IBOutlet weak var sourceLabel:       UILabel!
    @IBOutlet weak var dateLabel:         UILabel!
    @IBOutlet weak var titleLabel:        UILabel!  {
        didSet {
            titleLabel.font.withSize(26.0)
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: titleLabel.textColor = UIColor.blackCustom
            case 1: titleLabel.textColor = UIColor.whiteCustom
            default: break
            }
        }
    }
    @IBOutlet weak var shortContentLabel: UILabel!{
        didSet {
            shortContentLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
        }
    }
}
