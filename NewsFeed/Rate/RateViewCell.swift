import UIKit

class RateViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageIcon: UIImageView! {
        didSet {
            imageIcon.layer.cornerRadius = 8.0
            imageIcon.clipsToBounds      = true
        }
    }
    
    @IBOutlet weak var shortNameRate: UILabel! {
        didSet {
            shortNameRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 19.0)
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: shortNameRate.textColor = blackColor
                print("Presented light display mode on RateVc")
            case 1: shortNameRate.textColor = whiteColor
                print("Presented dark display mode on RateVc")
            default: break
            }
        }
    }
    
    @IBOutlet weak var valueRate: UILabel! {
        didSet {
            valueRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 19.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: valueRate.textColor = blackColor
            case 1: valueRate.textColor = blackColor
            default: break
            }
        }
    }
}



