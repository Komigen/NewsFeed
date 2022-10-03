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
            shortNameRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: shortNameRate.textColor = UIColor.blackCustom
//                print("Presented light display mode on RateVc")
            case 1: shortNameRate.textColor = UIColor.whiteCustom
//                print("Presented dark display mode on RateVc")
            default: break
            }
        }
    }
    
    @IBOutlet weak var valueRate: UILabel! {
        didSet {
            valueRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: valueRate.textColor = UIColor.blackCustom
            case 1: valueRate.textColor = UIColor.whiteCustom
            default: break
            }
        }
    }
    
    @IBOutlet weak var dollarSymbol: UILabel! {
        didSet {
            dollarSymbol.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: dollarSymbol.textColor = UIColor.blackCustom
            case 1: dollarSymbol.textColor = UIColor.whiteCustom
            default: break
            }
        }
    }
}



