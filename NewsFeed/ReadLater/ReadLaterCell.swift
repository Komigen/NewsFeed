import UIKit

class ReadLaterCell: UITableViewCell {
    
    @IBOutlet weak var imagePost: UIImageView!{
        didSet {
            imagePost.layer.cornerRadius = 8.0
            imagePost.clipsToBounds = true
            imagePost.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            imagePost.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var sourceLabel: UILabel! {
        didSet {
            sourceLabel.textColor = UIColor.systemGrayCustom
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = UIColor.systemGrayCustom
        }
    }
    @IBOutlet weak var titleLabel: UILabel!  {
        didSet {
            titleLabel.font.withSize(26.0)
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            case true: titleLabel.textColor = UIColor.blackCustom
            case false: titleLabel.textColor = UIColor.whiteCustom
            }
        }
    }
    @IBOutlet weak var shortContentLabel: UILabel!{
        didSet {
            shortContentLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            shortContentLabel.textColor = UIColor.systemGrayCustom
        }
    }
}
