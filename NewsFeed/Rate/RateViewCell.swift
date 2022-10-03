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
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            case true:  shortNameRate.textColor = UIColor.blackCustom
//                print("Presented light display mode on RateVc")
            case false: shortNameRate.textColor = UIColor.whiteCustom
//                print("Presented dark display mode on RateVc")
            }
        }
    }
    
    @IBOutlet weak var valueRate: UILabel! {
        didSet {
            valueRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            case true:  valueRate.textColor = UIColor.blackCustom
            case false: valueRate.textColor = UIColor.whiteCustom
            }
        }
    }
    
    @IBOutlet weak var dollarSymbol: UILabel! {
        didSet {
            dollarSymbol.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 16.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            case true:  dollarSymbol.textColor = UIColor.blackCustom
            case false: dollarSymbol.textColor = UIColor.whiteCustom
            }
        }
    }
}



