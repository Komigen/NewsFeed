import UIKit

class RateViewCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView! {
        didSet {
            imageIcon.layer.cornerRadius = 8.0
            imageIcon.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var shortNameRate: UILabel! {
        didSet {
            shortNameRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.font) as? CGFloat ?? 16.0)
            
            let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
            if let safeAnswer = savedAnswer {
                if safeAnswer {
                    shortNameRate.textColor = UIColor.blackCustom
                } else {
                    shortNameRate.textColor = UIColor.whiteCustom
                }
            }
        }
    }
    
    @IBOutlet weak var valueRate: UILabel! {
        didSet {
            valueRate.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.font) as? CGFloat ?? 16.0)
            
            let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
            if let safeAnswer = savedAnswer {
                if safeAnswer {
                    valueRate.textColor = UIColor.blackCustom
                } else {
                    valueRate.textColor = UIColor.whiteCustom
                }
            }
        }
    }
    
    @IBOutlet weak private var dollarSymbol: UILabel! {
        didSet {
            dollarSymbol.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.font) as? CGFloat ?? 16.0)
            
            let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
            if let safeAnswer = savedAnswer {
                if safeAnswer {
                    dollarSymbol.textColor = UIColor.blackCustom
                } else {
                    dollarSymbol.textColor = UIColor.whiteCustom
                }
            }
        }
    }
}
    
    
