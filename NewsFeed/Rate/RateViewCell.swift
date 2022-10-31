import UIKit

class RateViewCell: UITableViewCell {
    
    private var fontSize = CGFloat((userDefaults.object(forKey: KeyForUserDefaults.slider) as? Float ?? 19.0))
    
    @IBOutlet weak var imageIcon: UIImageView! {
        didSet {
            imageIcon.layer.cornerRadius = 8.0
            imageIcon.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var shortNameRate: UILabel! {
        didSet {
            shortNameRate.font.withSize(fontSize)
        }
    }
    
    @IBOutlet weak var valueRate: UILabel! {
        didSet {
            valueRate.font.withSize(fontSize)
        }
    }
    
    @IBOutlet weak private var dollarSymbol: UILabel! {
        didSet {
            dollarSymbol.font.withSize(fontSize)
        }
    }
}


